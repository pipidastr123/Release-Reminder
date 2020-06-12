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
	
    let viewModel = EditMusiciansViewModel()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		textField.delegate = self
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "Favorite Musicians"
        
        viewModel.didChange = { [weak self] in
            DispatchQueue.main.async {
                self?.update()
            }
        }
        viewModel.didAddedSuccessfully = { [weak self] name in
            DispatchQueue.main.async {
                self?.showAlert(title: "Success", text: "You've added \"\(name)\" to your list of faorite artists")
            }
        }
        viewModel.didGetError = { [weak self] error in
            DispatchQueue.main.async {
                self?.showAlert(title: "Error", text: error.localizedDescription)                
            }
        }
    }
    
    private func update() {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source & Table view delegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows(in: section)
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: MusicianCell.reuseID, for: indexPath) as! MusicianCell
        cell.configure(with: viewModel.getModel(forIndexPath: indexPath))
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.addMusicianToFavorite(at: indexPath)
	}

}

extension EditMusiciansViewController: UITextFieldDelegate {
	private func searchMusicians() {
		guard let name = textField.text else {
			return
		}
        viewModel.searchMusicians(withQuery: name)
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		searchMusicians()
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	
}
