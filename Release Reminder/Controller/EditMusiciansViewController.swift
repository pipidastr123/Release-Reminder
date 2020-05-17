//
//  EditMusiciansViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 13.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class EditMusiciansViewController: UITableViewController {

	
	@IBOutlet weak var textField: SearchTextField!
	
	var musicians = [MusicianCard]()
//	var choosedMusicians = [MusicianCard]()
	
	override func viewDidLoad() {
        super.viewDidLoad()
//		NetworkDataFetcher.shared.getFavoriteMusicians { [weak self] (result) in
//			switch result {
//				case .success(let response):
//					self?.musicians = response.results.map({ (name) -> MusicianCard in
//						return MusicianCard(name: name, imageData: nil)
//					})
//					DispatchQueue.main.async {
//						self?.tableView.reloadData()
//					}
//				case .failure(let error):
//					self?.showAlert(title: "Error", text: error.localizedDescription)
//			}
//		}
		textField.delegate = self
//		navigationItem.leftBarButtonItem?.isEnabled = false
    }

    // MARK: - Table view data source & Table view delegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return musicians.count
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: MusicianCell.reuseID, for: indexPath) as! MusicianCell
		cell.configure(with: musicians[indexPath.row])
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let cell = tableView.cellForRow(at: indexPath) as? MusicianCell else {
			return
		}
		guard let name = cell.musicianNameLabel.text else {
			return
		}
		let value = MusicianCard(name: name, imageData: nil)
		NetworkDataFetcher.shared.addFavoriteMusician(value) { [weak self] (result) in
			switch result {
				case .success():
					print("successfully added \(name)")
					break
				case .failure(let error):
					self?.showAlert(title: "Error", text: error.localizedDescription)
			}
		}
	}

}

extension EditMusiciansViewController: UITextFieldDelegate {
	private func searchMusicians() {
		guard let name = textField.text else {
			return
		}
		NetworkDataFetcher.shared.searchMusicians(forName: name) { [weak self] (result) in
			switch result {
				case .success(let response):
					self?.musicians = response.results.map({ (name) -> MusicianCard in
						return MusicianCard(name: name, imageData: nil)
					})
					DispatchQueue.main.async {
						self?.tableView.reloadData()
				}
				case .failure(let error):
					self?.showAlert(title: "Error", text: error.localizedDescription)
			}
		}
	}
	
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		searchMusicians()
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	
}
