//
//  Release.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 05.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

struct Release: Codable {
	var releaseName: String
	var musicianName: String
	var cover: Data?
//	var urls: [String: URL]?
	var songs: [String]
	var songsCount: Int
}
