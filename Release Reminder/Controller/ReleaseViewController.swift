//
//  ReleaseViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 13.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class ReleaseViewController: UIViewController {
	
	var release: Release?
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
}

extension ReleaseViewController: UITableViewDelegate {
	
}

extension ReleaseViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		self.release!.songsCount + 2
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		if indexPath.row == 0 {
//			let cell = tableView.dequeueReusableCell(withIdentifier: NameAndMusicianNameCell.reuseID) as! NameAndMusicianNameCell
//			cell.releaseNameLabel.text = self.release!.releaseName
//			cell.musicianNameLabel.text = self.release!.musicianName
//			return cell
//		} else if indexPath.row == 1 {
//			let cell = tableView.dequeueReusableCell(withIdentifier: CoverImageCell.reuseID) as! CoverImageCell
//			if let data = self.release!.cover {
//				cell.coverImage.image = UIImage(data: data)
//			} else {
//				cell.coverImage.image = UIImage(systemName: "music.note")
//			}
//			return cell
//		} else {
//			let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.reuseID) as! SongCell
//			cell.songNameLabel.text = self.release!.songs[indexPath.row - 2]
//			return cell
//		}
		return tableView.dequeueReusableCell(withIdentifier: SongCell.reuseID, for: indexPath)
	}
	
	
}
