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
		//TODO: sending registration/login data to server
	}
	
}

extension LoginRegisterViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		resignFirstResponder()
	}
	
}
