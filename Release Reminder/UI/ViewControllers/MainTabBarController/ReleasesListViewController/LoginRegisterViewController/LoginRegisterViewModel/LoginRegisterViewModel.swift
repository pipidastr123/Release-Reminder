//
//  LoginRegisterViewModel.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 09.06.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

class LoginRegisterViewModel {
    
    var didGetError: ((Error) -> Void)?
    var didAuthenticateSuccessfully: (() -> Void)?
    
    func authenticate(user: User, with type: SignInType) {
        UserManager.shared.authenticate(user: user, with: type) { (result) in
            switch result {
                case .success():
                    self.didAuthenticateSuccessfully?()
                case .failure(let error):
                    self.didGetError?(error)
            }
        }
    }
}
