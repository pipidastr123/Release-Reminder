//
//  UIImageView + network.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 16.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

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
			self?.image = UIImage(data: data)
		}
	}
}
