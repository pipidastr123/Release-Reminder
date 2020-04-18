//
//  MainScreenTableViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 05.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class MainScreenTableViewController: UITableViewController {
	
	let arr_of_names = ["Зомби надо хоронить", "Сожги этот альбом", "Горько"]

    override func viewDidLoad() {
        super.viewDidLoad()
		
//		if !UserDefaults().bool(forKey: "isLoggedIn") {
			chooseLoginRegister()
//		}
		
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
	
	private func chooseLoginRegister() {
		let ac = UIAlertController(title: "You are not logged in",
								   message: "Do you want to log in using existing account, or register a new one?",
								   preferredStyle: .alert)
		let login = UIAlertAction(title: "Login", style: .default) { (_) in
			DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5) {
				self.performSegue(withIdentifier: "LoginScreen", sender: nil)
			}
		}
		
		let register = UIAlertAction(title: "Register", style: .default) { (_) in
			DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5) {
				self.performSegue(withIdentifier: "RegisterScreen", sender: nil)
			}
		}
		
		let cancel = UIAlertAction(title: "No Registration", style: .cancel) { (_) in
			let deviceID = UIDevice().identifierForVendor
			//TODO: sent UUID to server
		}
		
		ac.addAction(login)
		ac.addAction(register)
		ac.addAction(cancel)
		present(ac, animated: true)
	}
	
	//MARK: Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.identifier {
			case "ToReleaseScreen":
				let dvc = segue.destination as! ReleaseViewController
				let image = UIImage(named: "Loqie Cover")!
				let release = Release(releaseName: arr_of_names[0], musicianName: "Loqiemean", cover: image.pngData(), songs: arr_of_names, songsCount: 3)
				dvc.release = release
			case "LoginScreen":
				let dvc = segue.destination as! LoginRegisterViewController
				dvc.toLogin = true
			case "RegisterScreen":
				let dvc = segue.destination as! LoginRegisterViewController
				dvc.toLogin = false
			default:
				return
		}
		
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Record", for: indexPath) as! RecordCell
		
		//TODO: fill cell with data from array
		
        return cell
    }


}
