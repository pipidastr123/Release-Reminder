//
//  MainScreenTableViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 05.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

protocol ReleasesListViewControllerRouting {
    func presentSignInViewController(_ completion: (() -> Void)?)
    func presentReleaseViewController(_ release: Release, _ completion: (() -> Void)?)
    func navigateBack(_ completion: (() -> Void)?)
}

class ReleasesListViewController: UITableViewController {
	
//	var releases = [Release]()
    
    let viewModel = ReleaseListViewModel()
    var router: ReleasesListViewControllerRouting?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		refreshControl = UIRefreshControl()
		refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        viewModel.didChange = { [weak self] in
            self?.update()
        }
        viewModel.didGetError = { [weak self] error in
            self?.showAlert(title: "Error", text: error.localizedDescription)
        }
        
        viewModel.queryNewReleases()
//		if !UserDefaults().bool(forKey: "isLoggedIn") {
//			chooseLoginRegister()
//		}
		
    }
    
    private func update() {
        self.tableView.reloadData()
        
    }
	
	@objc private func refreshData() {
        viewModel.queryNewReleases()
	}
	
	private func chooseLoginRegister() {
		let ac = UIAlertController(title: "You are not logged in",
								   message: "Do you want to log in using existing account, or register a new one?",
								   preferredStyle: .alert)
		let login = UIAlertAction(title: "Login", style: .default) { (_) in
			DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5) {
				self.performSegue(withIdentifier: SeguesID.loginScreen, sender: nil)
			}
		}
		
		let register = UIAlertAction(title: "Register", style: .default) { (_) in
			DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5) {
				self.performSegue(withIdentifier: SeguesID.registerScreen, sender: nil)
			}
		}
		
		let cancel = UIAlertAction(title: "No Registration", style: .cancel) { (_) in
//			let deviceID = UIDevice().identifierForVendor
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
			case SeguesID.releaseScreen:
//				let dvc = segue.destination as! ReleaseViewController
//				let image = UIImage(named: "Loqie Cover")!
//				let release = Release(releaseName: arr_of_names[0], musicianName: "Loqiemean", cover: image.pngData(), songs: arr_of_names, songsCount: 3)
//				dvc.release = release
				return
			case SeguesID.loginScreen:
				let dvc = segue.destination as! LoginRegisterViewController
				dvc.toLogin = true
			case SeguesID.registerScreen:
				let dvc = segue.destination as! LoginRegisterViewController
				dvc.toLogin = false
			default:
				return
		}
		
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows(in: section)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: RecordCell.reuseID, for: indexPath) as! RecordCell
		return cell
	}
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? RecordCell else {
            return
        }
        cell.configure(with: viewModel.getModel(at: indexPath))
    }
	
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.presentReleaseViewController(viewModel.getModel(at: indexPath), nil)
    }

}
