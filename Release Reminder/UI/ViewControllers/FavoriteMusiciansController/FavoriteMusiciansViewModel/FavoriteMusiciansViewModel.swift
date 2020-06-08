//
//  FavoriteMusiciansViewModel.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 08.06.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

class FavoriteMusiciansViewModel {
    var models = [MusicianCard]()
    
    var didChange: (() -> Void)?
    var didGetError: ((Error) -> Void)?
    var didDeleteRows: (([IndexPath]) -> Void)?
    
    func getNumberOfRows(in section: Int) -> Int {
        models.count
    }
    
    func getMusicianModel(forIndexPath indexPath: IndexPath) -> MusicianCard {
        models[indexPath.row]
    }
    
    func queryMusicians() {
        NetworkDataFetcher.shared.getFavoriteMusicians { [weak self] (result) in
            switch result {
                case .success(let response):
                    self?.models = response.results.map({ (name) -> MusicianCard in
                        return MusicianCard(name: name, imageData: nil)
                    })
                    self?.didChange?()
                case .failure(let error):
                    self?.didGetError?(error)
            }
        }
    }
    
    func removeMusician(atIndexPath indexPath: IndexPath) {
        let value = models[indexPath.row]
        //FIXME: token problem
        NetworkDataFetcher.shared.removeFavoriteMusician(value) { [weak self] (result) in
            switch result {
                case .success():
                    self?.models.remove(at: indexPath.row)
                    self?.didDeleteRows?([indexPath])
                case .failure(let error):
                    self?.didGetError?(error)
            }
        }
    }
}
