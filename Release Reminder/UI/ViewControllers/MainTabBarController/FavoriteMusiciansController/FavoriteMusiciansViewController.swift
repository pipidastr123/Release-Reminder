//
//  FavoriteMusiciansController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 17.05.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

protocol FavoriteMusiciansViewControllerRouting {
    func presentEditMusiciansViewController(_ completion: (() -> Void)?)
}

class FavoriteMusiciansViewController: UITableViewController {
    
    let viewModel = FavoriteMusiciansViewModel()
    var router: FavoriteMusiciansViewControllerRouting?

	override func viewDidLoad() {
		super.viewDidLoad()
		refresh()
		refreshControl = UIRefreshControl()
		refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
//        if let navBar = navigationController?.navigationItem {
//            navBar.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
//        }
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "Favorite Musicians"
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
        
        viewModel.didChange = { [weak self] in
            self?.update()
        }
        viewModel.didGetError = { [weak self] error in
            self?.showAlert(title: "Error", text: error.localizedDescription)
        }
        viewModel.didDeleteRows = { [weak self] indexPaths in
            self?.tableView.deleteRows(at: indexPaths, with: .left)
        }
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refresh()
    }
    
    private func update() {
        self.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
	
	@objc func refresh() {
        viewModel.queryMusicians()
	}
    
    @objc private func editButtonTapped() {
        router?.presentEditMusiciansViewController(nil)
    }

}

extension FavoriteMusiciansViewController {
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows(in: section)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: MusicianCell.reuseID, for: indexPath) as! MusicianCell
		return cell
	}
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? MusicianCell else {
            return
        }
        cell.configure(with: viewModel.getMusicianModel(forIndexPath: indexPath))
    }
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
            viewModel.removeMusician(atIndexPath: indexPath)
		}
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		60
	}
	
}
