//
//  AuthService.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 16.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

class AuthService {
	
	static let shared = AuthService()
	private init() {}
	
	private let networking = NetworkService()
	
	private func register(withUser user: User, completion: @escaping (Result<String?, Error>) -> ()) {
		networking.request(path: Query.register, params: [user.username, user.password]) { (data, error) in
			guard let data = data else {
				completion(.failure(error!))
				return
			}
			do {
				let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
				if let status = json["status"] as? String, status == "ok" {
					completion(.success(nil))
				} else if let userError = json["error"] as? String, userError == AuthError.userExists.localizedDescription {
					completion(.failure(AuthError.userExists))
				} else {
					completion(.failure(AuthError.badAuth))
				}
			} catch {
				completion(.failure(error))
				return
			}
		}
	}
	
	private func login(withUser user: User, completion: @escaping (Result<String?, Error>) -> ()) {
		networking.request(path: Query.login, params: [user.username, user.password]) { (data, error) in
			guard let data = data else {
				completion(.failure(error!))
				return
			}
			do {
				let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
				if let token = json["token"] as? String {
					
					completion(.success(token))
				} else {
					completion(.failure(AuthError.badAuth))
				}
			} catch {
				completion(.failure(error))
				return
			}
		}
	}
	
	func performAuthentication(for user: User, isLogin: Bool, completion: @escaping (Result<String?, Error>) -> ()) {
		if isLogin {
			login(withUser: user, completion: completion)
		} else {
			register(withUser: user, completion: completion)
		}
	}
}
