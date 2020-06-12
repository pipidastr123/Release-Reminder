//
//  LoginRegisterViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 18.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

protocol LoginRegisterRouting {
    func navigateBackToReleasesListVC(_ completion: (() -> Void)?)
}

class LoginRegisterViewController: UIViewController {
	
	@IBOutlet weak var loginTF: UITextField!
	@IBOutlet weak var passwordTF: UITextField!
	@IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var label: UILabel!
    weak var navigationBar: UINavigationItem?
	
    var authType: SignInType?
    let viewModel = LoginRegisterViewModel()
    var router: LoginRegisterRouting?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar = navigationController?.navigationBar.topItem
        switch authType {
            case .login:
                navigationBar?.title = "Login"
                loginButton.setTitle("Login", for: .normal)
                label.text = "Login"
            case .signUp:
                navigationBar?.title = "Register"
                loginButton.setTitle("Register", for: .normal)
                label.text = "Register"
            default:
                return
        }
        
		loginTF.delegate = self
		passwordTF.delegate = self
        
        viewModel.didAuthenticateSuccessfully = { [weak self] in
            DispatchQueue.main.async {
//                self?.dismiss(animated: true, completion: nil)
                self?.router?.navigateBackToReleasesListVC(nil)
            }
        }
        viewModel.didGetError = { [weak self] error in
            DispatchQueue.main.async {
                self?.showAlert(title: "Error", text: error.localizedDescription)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        loginTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
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
        viewModel.authenticate(user: user, with: authType!)
	}
	
}

extension LoginRegisterViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		resignFirstResponder()
	}
	
}
