//
//  ReleaseViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 05.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class ReleaseViewController: UIViewController {
	
	var release: Release?

	@IBOutlet weak var releaseNameLabel: UILabel!
	@IBOutlet weak var artistNameLabel: UILabel!
//	@IBOutlet var trackLabels: [UILabel]!
	@IBOutlet weak var coverImageView: UIImageView!
	var trackLabels: [UILabel]?

	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		guard let release = self.release else { return }
		navigationItem.prompt = release.releaseName
		
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
		}
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
