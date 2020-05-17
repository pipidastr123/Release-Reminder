//
//  NetworkService.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 06.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

class NetworkService {
	private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> ()) -> URLSessionDataTask {
		return URLSession.shared.dataTask(with: request) { (data, response, error) in
			DispatchQueue.main.async {
				completion(data, error)
			}
		}
	}
	
	func request(path: String, params: [String], token: String? = nil, completion: @escaping (Data?, Error?) -> ()) {
		var urlString = path + params.joined(separator: "/")
//		let urlString = "https://xn--80atsei1a.xn--h1ambjb.xn--p1ai/1.0/search/Three"
		if urlString.last == "/" {
			urlString.removeLast()
		}
		print(urlString)
		guard let url = URL(string: urlString) else {
			print("bad url")
			return
		}
//		print(url)
		var request = URLRequest(url: url)
		if let token = token {
			request.setValue(token, forHTTPHeaderField: "Token")
		}
		let task = createDataTask(from: request, completion: completion)
		task.resume()
	}
	
}
