//
//  UIImageView + network.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 16.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class WebImageView: UIImageView {
    private var currentURL: String?
    
    func set(imageURL: String?) {
        currentURL = imageURL
        guard let imageURL = imageURL, let url = URL(string: imageURL) else {
            self.image = nil
            return
        }
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)){
            self.image = UIImage(data: cachedResponse.data)
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print("Error during downloadin image from url: \(imageURL)")
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else {
            return
        }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
        
        if responseURL.absoluteString == currentURL {
            self.image = UIImage(data: data)
        }
    }
}

extension UIImageView {
	func downloadImage(from urlString: String) {
		guard let url = URL(string: urlString) else {
			return
		}
		URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
			guard let data = data else {
				print(error!.localizedDescription)
				return
			}
			DispatchQueue.main.async {
				self?.image = UIImage(data: data)
			}
		}.resume()
	}
}
