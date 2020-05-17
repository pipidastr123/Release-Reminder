//
//  UIViewController+ showAlert.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 16.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

extension UIViewController {
	func showAlert(title: String, text: String, completion: @escaping () -> () = {}) {
		let ac = UIAlertController(title: title, message: text, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
			completion()
		}
		ac.addAction(okAction)
		self.present(ac, animated: true)
	}
}
