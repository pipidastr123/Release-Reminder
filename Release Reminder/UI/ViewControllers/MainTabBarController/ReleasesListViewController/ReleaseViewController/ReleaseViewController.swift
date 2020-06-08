//
//  ReleaseViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 13.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

protocol ReleaseViewControllerRouting {
    func navigateBack(_ completion: (() -> Void)?)
}

class ReleaseViewController: UIViewController {
	
//	var release: Release?
    var viewModel: ReleaseViewModel!
    var router: ReleaseViewControllerRouting?
    
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
}

extension ReleaseViewController: UITableViewDataSource, UITableViewDelegate {
    
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows(in: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                return  tableView.dequeueReusableCell(withIdentifier: NameAndMusicianNameCell.reuseID, for: indexPath) as! NameAndMusicianNameCell
            case 1:
                return tableView.dequeueReusableCell(withIdentifier: CoverImageCell.reuseID, for: indexPath) as! CoverImageCell
            case 2..<Int.max:
                return  tableView.dequeueReusableCell(withIdentifier: SongCell.reuseID, for: indexPath) as! SongCell
            default:
            return UITableViewCell()
        }
	}
	
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? NameAndMusicianNameCell {
            cell.musicianNameLabel.text = viewModel.getArtistName()
            cell.releaseNameLabel.text = viewModel.getReleaseName()
        } else if let cell = cell as? CoverImageCell {
            let urlString = viewModel.getImageURL()
            guard urlString != "" else {
                cell.coverImage.image = UIImage(systemName: "music.note")
                return
            }
            cell.coverImage.downloadImage(from: urlString)
        } else if let cell = cell as? SongCell {
            cell.songNameLabel.text = viewModel.getTrackTitle(at: indexPath)
        }
    }
}