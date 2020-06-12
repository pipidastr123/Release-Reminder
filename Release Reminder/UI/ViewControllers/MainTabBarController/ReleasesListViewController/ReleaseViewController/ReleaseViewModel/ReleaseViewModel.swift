//
//  ReleaseViewModel.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 08.06.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

class ReleaseViewModel {
    var model: Release!
    
    var didChange: (() -> Void)?
    var didGetError: ((String) -> Void)?
    
    init(_ model: Release) {
        NetworkDataFetcher.shared.getMoreAboutRelease(model) { [weak self] (result) in
            switch result {
                case .success(let release):
                    self?.model = release
                    self?.didChange?()
                case .failure(let error):
                    self?.didGetError?(error.localizedDescription)
            }
        }
    }
    
    func getImageURL() -> String {
        guard let urlString = model?.cover?.large else {
            return ""
        }
        return urlString
    }
    
    func getArtistName() -> String {
        return model.artist!
    }
    
    func getReleaseName() -> String {
        return model.title
    }
    
    func getDate() -> String {
        return model.date
    }
    
    func getTrackTitle(at indexPath: IndexPath) -> String {
        guard let tracks = model.songs else {
            return ""
        }
        return tracks[indexPath.row - 2]
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        if model == nil {
            return 0
        }
        guard let tracks = model.songs else {
            return 2
        }
        return 2 + tracks.count
    }
}
