//
//  Errors.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 16.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

enum AuthError: Error {
	case badAuth, userExists
	
	var localizedDescription: String {
		switch self {
			case .badAuth:
				return "Error during authentication"
			case .userExists:
				return "User already exists"
		}
	}
}

enum QueryError: Error {
	case getFavMusicians, addFavMusician, delFavMusician, searchMusicians
	
	var localizedDescription: String {
		switch self {
			case .getFavMusicians:
				return "Error during fetching list of favorite musicians"
			case .searchMusicians:
				return "Error during fetching search results"
			case .addFavMusician:
				return "Error during adding favorite musician"
			case .delFavMusician:
				return "Error during removing musician from list of favorite musicians"
		}
	}
}

enum ServiceError: Error {
	case jsonError
	
	var localizedDescription: String {
		switch self {
			case .jsonError:
			return "Error in handling json response. Probably missing record"
		}
	}
}
