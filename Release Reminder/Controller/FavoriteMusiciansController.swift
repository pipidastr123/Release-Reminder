//
//  FavoriteMusiciansController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 17.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class FavoriteMusiciansController: UITableViewController {
	
	var musicians = [MusicianCard]()
//	var musicians = [String]()
	
//	private var refreshControl: UIRefreshControl = {
//		let refreshControl = UIRefreshControl()
//		refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//		return refreshControl
//	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		refresh()
		refreshControl = UIRefreshControl()
		refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
	}
	
	@objc func refresh() {
		NetworkDataFetcher.shared.getFavoriteMusicians { [weak self] (result) in
			self?.refreshControl?.endRefreshing()
			switch result {
				case .success(let response):
					self?.musicians = response.results.map({ (name) -> MusicianCard in
						return MusicianCard(name: name, imageData: nil)
					})
					self?.tableView.reloadData()
				case .failure(let error):
					self?.showAlert(title: "Error", text: error.localizedDescription)
			}
		}
		
	}

}

extension FavoriteMusiciansController {
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return musicians.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: MusicianCell.reuseID, for: indexPath) as! MusicianCell
		cell.configure(with: musicians[indexPath.row])
		return cell
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			let value = musicians[indexPath.row]
			//FIXME: token problem
//			NetworkDataFetcher.shared.removeFavoriteMusician(value, token: String, completion: {})
			NetworkDataFetcher.shared.removeFavoriteMusician(value) { [weak self] (result) in
				switch result {
					case .success():
						self?.musicians.remove(at: indexPath.row)
						self?.tableView.deleteRows(at: [indexPath], with: .automatic)
					case .failure(let error):
						self?.showAlert(title: "Error", text: error.localizedDescription)
				}
			}
			
			
		}
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		60
	}
	
}
