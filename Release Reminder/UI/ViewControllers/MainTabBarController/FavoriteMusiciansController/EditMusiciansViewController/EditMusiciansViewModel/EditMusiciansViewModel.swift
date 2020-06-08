//
//  EditMusiciansViewModel.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 08.06.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

class EditMusiciansViewModel {
    
    var musicians = [MusicianCard]()
    
    var didChange: (() -> Void)?
    var didGetError: ((Error) -> Void)?
    
    func getNumberOfRows(in section: Int) -> Int {
        musicians.count
    }
    
    func getModel(forIndexPath indexPath: IndexPath) -> MusicianCard {
        musicians[indexPath.row]
    }
    
    func searchMusicians(withQuery string: String) {
        NetworkDataFetcher.shared.searchMusicians(forName: string) { [weak self] (result) in
            switch result {
                case .success(let response):
                    self?.musicians = response.results.map({ (name) -> MusicianCard in
                        return MusicianCard(name: name, imageData: nil)
                    })
                    self?.didChange?()
                case .failure(let error):
                    self?.didGetError?(error)
            }
        }
    }
    
    func addMusicianToFavorite(at indexPath: IndexPath) {
        NetworkDataFetcher.shared.addFavoriteMusician(musicians[indexPath.row]) { [weak self] (result) in
            switch result {
                case .success():
                    print("successfully added \(self?.musicians[indexPath.row].name)")
                    break
                case .failure(let error):
                    self?.didGetError?(error)
            }
        }
    }
    
}
