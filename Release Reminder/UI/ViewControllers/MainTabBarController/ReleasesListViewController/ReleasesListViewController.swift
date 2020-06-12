//
//  MainScreenTableViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 05.04.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

protocol ReleasesListViewControllerRouting {
    func presentSignInViewController(withAuthorizationType type: SignInType, _ completion: (() -> Void)?)
    func presentReleaseViewController(_ release: Release, _ completion: (() -> Void)?)
    func navigateBack(_ completion: (() -> Void)?)
}

enum SignInType: String {
    case signUp, login
}

class ReleasesListViewController: UITableViewController {
    
    let viewModel = ReleaseListViewModel()
    var router: ReleasesListViewControllerRouting?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		refreshControl = UIRefreshControl()
		refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "New Releases"
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        
        viewModel.didChange = { [weak self] in
            DispatchQueue.main.async {
                self?.update()
            }
        }
        viewModel.didGetError = { [weak self] error in
            DispatchQueue.main.async {
                self?.refreshControl?.endRefreshing()
                self?.showAlert(title: "Error", text: error.localizedDescription)
            }
        }
        
        viewModel.queryNewReleases()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !UserDefaults().bool(forKey: UserDefKey.isLoggedIn) {
            chooseLoginRegister()
        }
    }
    
    private func update() {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
	
	@objc private func refreshData() {
        viewModel.queryNewReleases()
	}
    
    @objc private func logoutButtonTapped() {
        viewModel.logout()
        chooseLoginRegister()
    }
	
	private func chooseLoginRegister() {
		let ac = UIAlertController(title: "You are not logged in",
								   message: "Do you want to log in using existing account, or register a new one?",
								   preferredStyle: .alert)
		let login = UIAlertAction(title: "Login", style: .default) { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.router?.presentSignInViewController(withAuthorizationType: .login, nil)
            }
		}
		
		let register = UIAlertAction(title: "Register", style: .default) { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.router?.presentSignInViewController(withAuthorizationType: .signUp, nil)
            }
		}
		
		ac.addAction(login)
		ac.addAction(register)
		present(ac, animated: true)
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
        tableView.deselectRow(at: indexPath, animated: true)
        router?.presentReleaseViewController(viewModel.getModel(at: indexPath), nil)
    }

}
