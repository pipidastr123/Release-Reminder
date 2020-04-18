//
//  EditMusiciansViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 13.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class EditMusiciansViewController: UITableViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	
	var musicians = [MusicianCard]()
	
	override func viewDidLoad() {
        super.viewDidLoad()

		searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

extension EditMusiciansViewController: UISearchBarDelegate {
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		guard let name = searchBar.text else {
			return
		}
		NetworkManager.shared.getMusicians(forName: name) { (cards) in
			self.musicians = cards
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
}
