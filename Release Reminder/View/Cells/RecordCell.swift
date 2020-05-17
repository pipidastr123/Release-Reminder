//
//  RecordCell.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 05.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class RecordCell: UITableViewCell {
	static let reuseID = "Record"
	
	//MARK: Properties
	var releaseInfo: Release?
	
	//MARK: Outlets
	@IBOutlet weak var releaseNameLabel: UILabel!
	@IBOutlet weak var musicianNameLabel: UILabel!
	@IBOutlet weak var coverImageView: UIImageView!
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func configure(with model: Release) {
		releaseNameLabel.text = model.title
		//TODO: complete filling view with model
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
