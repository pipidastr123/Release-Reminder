//
//  MainScreenTableViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 05.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class MainScreenTableViewController: UITableViewController {
	
	let arr_of_names = ["Зомби надо хоронить", "Сожги этот альбом"]

    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
	
	//MARK: Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ToReleaseScreen" {
			let navigationVC = segue.destination as! UINavigationController
			let dvc = navigationVC.topViewController as! ReleaseViewController
			let release = Release(releaseName: arr_of_names[0], musicianName: "Loqiemean", cover: nil, urls: nil, songs: arr_of_names, songsCount: 15)
			dvc.release = release
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
		
		
		
        return cell
    }


}
