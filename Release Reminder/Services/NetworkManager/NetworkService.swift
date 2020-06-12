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
            completion(data, error)
		}
	}
	
	func request(path: String, params: [String], token: String? = nil, completion: @escaping (Data?, Error?) -> ()) {
		var urlString = path + params.joined(separator: "/")
		if urlString.last == "/" {
			urlString.removeLast()
		}
//        urlString = urlString.replacingOccurrences(of: " ", with: "%20")
        let encodedUrl = urlString.encodeUrl
		print(encodedUrl)
		guard let url = URL(string: encodedUrl) else {
			print("bad url")
			return
		}
		var request = URLRequest(url: url)
		if let token = token {
			request.setValue(token, forHTTPHeaderField: "Token")
		}
		let task = createDataTask(from: request, completion: completion)
		task.resume()
	}
	
}
