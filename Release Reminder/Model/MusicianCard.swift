//
//  MusicianCard.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 13.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

struct MusicianSearchResponse: Codable {
	let results: [String]
}

struct MusicianCard: Codable {
	var name: String
	var image: Data?
	
	init(name: String, imageData: Data?) {
		self.name = name
		self.image = imageData
	}
}
