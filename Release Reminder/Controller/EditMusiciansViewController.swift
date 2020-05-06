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
		NetworkDataFetcher.shared.getFavoriteMusicians { [weak self] (response) in
			self?.musicians = response.results.map({ (name) -> MusicianCard in
				return MusicianCard(name: name, imageData: nil)
			})
			self?.tableView.reloadData()
		}
		searchBar.delegate = self
    }

    // MARK: - Table view data source & Table view delegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//FIXME: unhardcode this
		return musicians.count
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: MusicianCell.reuseID, for: indexPath) as! MusicianCell
		cell.musicianNameLabel.text = musicians[indexPath.row].name
		cell.musicianImageView.image = UIImage(systemName: "person")
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}

}

extension EditMusiciansViewController: UISearchBarDelegate {
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		guard let name = searchBar.text else {
			return
		}
		NetworkDataFetcher.shared.getMusicians(forName: name) { [weak self] (response) in
			self?.musicians = response.results.map({ (name) -> MusicianCard in
				return MusicianCard(name: name, imageData: nil)
			})
			DispatchQueue.main.async {
				self?.tableView.reloadData()
			}
		}
	}
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let name = searchBar.text else {
			return
		}
		NetworkDataFetcher.shared.getMusicians(forName: name) { [weak self] (response) in
			self?.musicians = response.results.map({ (name) -> MusicianCard in
				return MusicianCard(name: name, imageData: nil)
			})
			DispatchQueue.main.async {
				self?.tableView.reloadData()
			}
		}
	}
}
