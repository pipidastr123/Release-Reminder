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
        self.model = model
//        self.model.songs = [
//            "House  On Fire",
//            "They Don't Want What We Want (And They Don't Care",
//            "Down To Hell",
//            "Antisocialist",
//            "I Don't Need You",
//            "All Due Respect",
//            "Take Some Time",
//            "One Turns To None",
//            "It's Not Me (It's You)",
//            "Here's To Starting Over",
//            "What's Gonna Be",
//            "Give You Up",
//            "In My Blood",
//            "The Violence",
//            "Lorazepam"
//        ]
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
        guard let urlString = model.cover?.large else {
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
        guard let tracks = model.tracks else {
            return ""
        }
        return tracks[indexPath.row - 1]
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        if model == nil {
            return 0
        }
        guard let tracks = model.tracks else {
            return 1
        }
        return 1 + tracks.count
    }
}
