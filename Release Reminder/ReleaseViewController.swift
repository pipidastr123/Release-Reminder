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
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var navBar: UINavigationItem!
	@IBOutlet weak var button: UIButton!
	var trackLabels: [UILabel]?

	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		guard let release = self.release else { return }
		navBar.title = release.releaseName
		
		let frame = self.view.frame
		var (x, y, width, height) = (frame.minX, frame.minY, frame.width, frame.height + CGFloat(20 * release.songsCount))
		var newFrame = CGRect(x: x, y: y, width: width, height: height)
		self.view.frame = newFrame
		scrollView.frame = newFrame
		
		let bFrame = button.frame
		(x, y, width, height) = (bFrame.minX, bFrame.minY, bFrame.width, bFrame.height)
		newFrame = CGRect(x: x, y: y + 150, width: width, height: height)
		let label = UILabel(frame: newFrame)
		scrollView.addSubview(label)
		label.text = "THE DOOMSLAYER"
		
		
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
