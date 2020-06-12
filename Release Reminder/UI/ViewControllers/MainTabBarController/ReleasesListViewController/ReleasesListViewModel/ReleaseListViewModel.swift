//
//  ReleaseListViewModel.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 08.06.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

class ReleaseListViewModel {
    var models = [Release]()
    
    var didChange: (() -> Void)?
    var didGetError: ((Error) -> Void)?
    
    func getNumberOfRows(in section: Int) -> Int {
        models.count
    }
    
    func getModel(at indexPath: IndexPath) -> Release {
        return models[indexPath.row]
    }
    
    func queryNewReleases() {
        NetworkDataFetcher.shared.getNewReleases { (result) in
            switch result {
                case .success(let response):
                    self.models = response.results
                    self.didChange?()
                case .failure(let error):
                    self.didGetError?(error)
            }
        }
    }
    
    func logout() {
        self.models.removeAll()
        self.didChange?()
        UserManager.shared.logout()
    }
}
