//
//  Release.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 05.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

struct Release {
	let releaseName: String
	let musicianName: String
	let cover: UIImage?
	let urls: [String: URL]?
	let songs: [String]
	let songsCount: Int
}
