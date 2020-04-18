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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//		guard let release = self.release else { return }
		//		navBar.title = release.releaseName
		
		
		
		//TODO: Сделать кастомный View класс на VStack с динамическим добавлением лейблов
		
		
		//		trackLabels = release.songs.map { songName -> UILabel in
		//			let label = UILabel()
		//			label.text = songName
		//			view.addSubview(label)
		//			let constraints = [
		//				label.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 20),
		//				label.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor),
		//				label.trailingAnchor.constraint(equalTo: coverImageView.trailingAnchor),
		//
		//			]
		//			return label
		//		}
	}
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destination.
	// Pass the selected object to the new view controller.
	}
	*/
	
}

extension ReleaseViewController: UITableViewDelegate {
	
}

extension ReleaseViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.release!.songsCount + 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Name And Musician Name") as! NameAndMusicianNameCell
			cell.releaseNameLabel.text = self.release!.releaseName
			cell.musicianNameLabel.text = self.release!.musicianName
			return cell
		} else if indexPath.row == 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cover Image") as! CoverImageCell
			if let data = self.release!.cover {
				cell.coverImage.image = UIImage(data: data)
			} else {
				//TODO: default image
				cell.coverImage.image = UIImage(named: "")
			}
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Song") as! SongCell
			cell.songNameLabel.text = self.release!.songs[indexPath.row - 2]
			return cell
		}
	}
	
	
}
