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
    
	func getNewReleases(completion: @escaping (Result<ReleaseResponse, Error>) -> ()) {
        network.request(path: Query.newReleases, params: [], token: UserManager.shared.token) { (data, error) in
			guard let data = data else {
				completion(.failure(error!))
				return
			}
			do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
				let response = try JSONDecoder().decode(ReleaseResponse.self, from: data)
				completion(.success(response))
			} catch {
				completion(.failure(error))
			}
		}
	}
    
    func getMoreAboutRelease(_ model: Release, completion: @escaping (Result<Release, Error>) -> ()) {
        guard let artist = model.artist else {
            return
        }
        network.request(path: Query.tracks, params: [artist, model.title]) { (data, error) in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                let response = try JSONDecoder().decode(Release.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }
	
	func searchMusicians(forName name: String, completion: @escaping (Result<MusicianSearchResponse, Error>) -> ()) {
		let name = name.replacingOccurrences(of: " ", with: "%20")
		network.request(path: Query.search, params: [name]) { (data, error) in
			guard let data = data else {
				completion(.failure(QueryError.searchMusicians))
				return
			}
			do {
				let response = try JSONDecoder().decode(MusicianSearchResponse.self, from: data)
				completion(.success(response))
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	func getFavoriteMusicians(completion: @escaping (Result<MusicianSearchResponse, Error>) -> ()) {
        network.request(path: Query.getFavMusicians, params: [], token: UserManager.shared.token) { (data, error) in
			guard let data = data else {
				if let error = error {
					completion(.failure(error))
				} else {
					completion(.failure(QueryError.addFavMusician))
				}
				return
			}
			do {
				print(try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any])
				let response = try JSONDecoder().decode(MusicianSearchResponse.self, from: data)
				completion(.success(response))
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	func addFavoriteMusician(_ musician: MusicianCard, completion: @escaping (Result<Void, Error>) -> ()) {
		let name = musician.name.replacingOccurrences(of: " ", with: "%20")
        network.request(path: Query.addFavMusician, params: [name], token: UserManager.shared.token) { (data, error) in
			guard let data = data else {
				if let error = error {
					completion(.failure(error))
				} else {
					completion(.failure(QueryError.addFavMusician))
				}
				return
			}
			do {
				let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
				if let status = json["status"] as? String, status == "ok" {
					completion(.success(Void()))
					return
				} else {
					completion(.failure(ServiceError.jsonError))
				}
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	func removeFavoriteMusician(_ musician: MusicianCard, completion: @escaping (Result<Void, Error>) -> ()) {
		let name = musician.name.replacingOccurrences(of: " ", with: "%20")
        network.request(path: Query.removeFavMusician, params: [name], token: UserManager.shared.token) { (data, error) in
			guard let data = data else {
				if let error = error {
					completion(.failure(error))
				} else {
					completion(.failure(QueryError.delFavMusician))
				}
				return
			}
			do {
				let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
				if let status = json["status"] as? String, status == "ok" {
					completion(.success(Void()))
					return
				} else {
					completion(.failure(ServiceError.jsonError))
				}
			} catch {
				completion(.failure(error))
			}
		}
	}
}

