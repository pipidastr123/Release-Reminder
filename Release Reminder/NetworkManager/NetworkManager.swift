//
//  NetworkManager.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 19.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class NetworkManager {
	private init() {}
	
	static let shared = NetworkManager()
	
	func getNewReleases(completion: @escaping ([Release]) -> ()) {
		//TODO: url for api call
		guard let url = URL(string: "") else {
			print("Bad URL while in getNewReleases")
			return
		}
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print(error)
				print(error.localizedDescription)
				return
			}
			guard let data = data, let _ = response else {
				print("No data or repsonse in getNewReleases")
				return
			}
			guard let releases = try? JSONDecoder().decode([Release].self, from: data) else {
				print("unable to decode data with new releases")
				return
			}
			completion(releases)
		}.resume()
	}
	
	func getMusicians(forName name: String, completion: @escaping ([MusicianCard]) -> ()) {
		guard let url = URL(string: "") else {
			print("Bad URL while in getMusicians")
			return
		}
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print(error)
				print(error.localizedDescription)
				return
			}
			guard let data = data, let _ = response else {
				print("No data or repsonse in getMusicians")
				return
			}
			guard let musicians = try? JSONDecoder().decode([MusicianCard].self, from: data) else {
				print("unable to decode data with musicians")
				return
			}
			completion(musicians)
		}.resume()
	}
	
	func getImage(for urlString: String, completion: @escaping (UIImage) -> ()) {
		guard let url = URL(string: "") else {
			print("Bad URL while in getMusicians")
			return
		}
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print(error)
				print(error.localizedDescription)
				return
			}
			if let data = data, let _ = response {
				guard let image = UIImage(data: data) else {
					return
				}
				completion(image)
			}
		}.resume()
	}
}
