//
//  Release.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 05.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

struct ReleaseResponse: Codable {
	let results: [Release]
}

struct Release: Codable {
    let date: String
    let title: String
	let cover: Cover?
	let artist: String?
    let songs: [String]?
}

struct Cover: Codable {
	let large, small, full: String
}
