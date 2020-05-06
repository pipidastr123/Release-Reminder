//
//  NetworkDataFetcher.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 19.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class NetworkDataFetcher {
	private init() {}
	
	static let shared = NetworkDataFetcher()
	
	private let network = NetworkService()
	
	func getNewReleases(completion: @escaping (ReleaseResponse) -> ()) {
		//FIXME: unhardcode this (backend task - make it return last releases from different musicians
		let name = "Three Days Grace".replacingOccurrences(of: " ", with: "%20")
		network.request(path: API.Query.releases, params: [name]) { (data, error) in
			if let error = error {
				print("Error during 'getMusicians' func")
				print(error)
			}
			guard let data = data else {
				return
			}
			var response: ReleaseResponse
			do {
				response = try JSONDecoder().decode(ReleaseResponse.self, from: data)
			} catch {
				print(error)
				return
			}
			completion(response)
		}
	}
	
	func getMusicians(forName name: String, completion: @escaping (MusicianSearchResponse) -> ()) {
		network.request(path: API.Query.search, params: [name]) { (data, error) in
			if let error = error {
				print("Error during 'getMusicians' func")
				print(error)
			}
			guard let data = data else {
				return
			}
			var response: MusicianSearchResponse
			do {
				response = try JSONDecoder().decode(MusicianSearchResponse.self, from: data)
			} catch {
				print(error)
				return
			}
			completion(response)
		}
	}
	
	func getFavoriteMusicians(completion: @escaping (MusicianSearchResponse) -> ()) {
		//FIXME: uncomment this
//		network.request(path: API.Query.getFavMusicians, params: []) { (data, error) in
//			if let error = error {
//				print("Error during 'getMusicians' func")
//				print(error)
//			}
//			//TODO: complete getting fav musicians
//		}
	}
	
	func getImage(for urlString: String, completion: @escaping (UIImage) -> ()) {
		//TODO: complete this function
	}
}

