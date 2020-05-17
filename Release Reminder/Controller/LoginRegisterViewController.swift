//
//  LoginRegisterViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 18.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class LoginRegisterViewController: UIViewController {
	
	@IBOutlet weak var loginTF: UITextField!
	@IBOutlet weak var passwordTF: UITextField!
	@IBOutlet weak var navigationBar: UINavigationItem!
	@IBOutlet weak var loginButton: UIButton!
	
	var toLogin: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
		navigationBar.title = toLogin ? "Login" : "Register"
		loginButton.setTitle(toLogin ? "Login" : "Register", for: .normal)
		loginTF.delegate = self
		passwordTF.delegate = self
    }
    
	@IBAction func editingField(_ sender: UITextField) {
		if loginTF.text!.isEmpty, passwordTF.text!.isEmpty {
			loginButton.isEnabled = false
		}
	}
	
	@IBAction func loginButtonPressed(_ sender: UIButton) {
		guard let username = loginTF.text, let password = passwordTF.text else {
			self.showAlert(title: "Error", text: "Please, fill all fields")
			return
		}
		let user = User(username: username, password: password)
		AuthService.shared.performAuthentication(for: user, isLogin: toLogin) { (result) in
			switch result {
				case .success(let str):
					if let token = str {
						UserDefaults.standard.set(token, forKey: UserDefKey.userToken)
					}
					print("Successful authentication")
				case .failure(let error):
					self.showAlert(title: "Error", text: error.localizedDescription)
			}
		}
	}
	
}

extension LoginRegisterViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		resignFirstResponder()
	}
	
}
