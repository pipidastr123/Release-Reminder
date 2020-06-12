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
		
        viewModel.didChange = { [weak self] in
            DispatchQueue.main.async {
                self?.update()
            }
        }
        viewModel.didGetError = { [weak self] error in
            DispatchQueue.main.async {
                self?.showAlert(title: "Error", text: error)
            }
        }
	}
    
    private func update() {
        tableView.reloadData()
    }
	
}

extension ReleaseViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows(in: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                return tableView.dequeueReusableCell(withIdentifier: NameAndMusicianNameCell.reuseID, for: indexPath) as! NameAndMusicianNameCell
            case 1..<Int.max:
                return tableView.dequeueReusableCell(withIdentifier: SongCell.reuseID, for: indexPath) as! SongCell
            default:
                return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? NameAndMusicianNameCell {
            cell.musicianNameLabel.text = viewModel.getArtistName()
            cell.releaseNameLabel.text = viewModel.getReleaseName()
            let urlString = viewModel.getImageURL()
            guard urlString != "" else {
                cell.coverImageView.image = UIImage(systemName: "music.note")
                return
            }
            cell.coverImageView.downloadImage(from: urlString)
        } else if let cell = cell as? SongCell {
            cell.songNameLabel.text = viewModel.getTrackTitle(at: indexPath)
        }
    }
}
