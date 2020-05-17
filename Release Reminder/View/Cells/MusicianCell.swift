//
//  MusicianCell.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 06.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class MusicianCell: UITableViewCell {
	static let reuseID = "MusicianCell"

	@IBOutlet weak var musicianImageView: UIImageView!
	@IBOutlet weak var musicianNameLabel: UILabel!
	
	func configure(with value: MusicianCard) {
		musicianNameLabel.text = value.name
		//FIXME: fill image when will have url for it
		musicianImageView.image = nil
	}
}
