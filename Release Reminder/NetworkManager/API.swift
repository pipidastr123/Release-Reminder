//
//  API.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 06.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

struct API {
	private init() {}
	static let server = "https://xn--80atsei1a.xn--h1ambjb.xn--p1ai/1.0/"
	struct Query {
		static let search = "\(API.server)search/"
		static let releases = "\(API.server)releases/"
		static let tracks = "\(API.server)tracks/"
		static let getFavMusicians = "\(API.server)"
	}
}
