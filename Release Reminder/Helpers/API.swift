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
	private static let apiVer = "1.0"
	static let server = "https://xn--80atsei1a.xn--h1ambjb.xn--p1ai/\(apiVer)"
	
	static let userToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiZ2F2bm8iLCJpZCI6Mn0.FPdtzCsJD354WI67MOxeR8H6_2G3Rme_q-VaJbH_CgU"
}

struct Query {
	static let search = "\(API.server)/search/"
	static let releases = "\(API.server)/releases/"
	static let newReleases = "\(API.server)/myreleases"
	static let tracks = "\(API.server)/tracks/"
	static let getFavMusicians = "\(API.server)/getsubs/"
	static let addFavMusician = "\(API.server)/addsub/"
	static let removeFavMusician = "\(API.server)/delsub/"
	static let register = "\(API.server)/register/"
	static let login = "\(API.server)/login/"
}

struct UserDefKey {
	static let userToken = "userToken"
    static let isLoggedIn = "isLoggedIn"
}
