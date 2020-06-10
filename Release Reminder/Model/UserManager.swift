//
//  User.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 16.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

struct User {
	let username: String
	let password: String	
}

class UserManager {
    static let shared = UserManager()
    private init() {}
    
    var token: String?
    var user: User?
    
    func authenticate(user: User, with type: SignInType, _ completion: @escaping (Result<Void, Error>) -> ()) {
        self.user = user
        AuthService.shared.performAuthentication(for: user, with: type) { (result) in
            switch result {
                case .success(let token):
                    if let token = token {
                        self.token = token
                        UserDefaults.standard.set(token, forKey: UserDefKey.userToken)
                        completion(.success(Void()))
                }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
