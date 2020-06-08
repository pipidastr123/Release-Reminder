//
//  ReleasesListFlowRouter.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 08.06.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class ReleasesListFlowRouter {
    let navigationController: UINavigationController
    let initialViewController: ReleasesListViewController
    
    init() {
        
        
        self.initialViewController = ReleasesListViewController.initFromItsStoryboard()
        
        let nvc = UINavigationController(rootViewController: self.initialViewController)
        nvc.navigationBar.isHidden = true
        nvc.modalPresentationStyle = .fullScreen
        self.navigationController = nvc
        
        self.initialViewController.router = self
//        self.navigationController.pushViewController(self.initialViewController, animated: false)
    }
}

extension ReleasesListFlowRouter: ReleasesListViewControllerRouting {
    func presentSignInViewController(_ completion: (() -> Void)?) {
        
    }
    
    func presentReleaseViewController(_ release: Release, _ completion: (() -> Void)?) {
        let vc = ReleaseViewController.initFromItsStoryboard()
        vc.router = self
        vc.viewModel = ReleaseViewModel(release)
        self.initialViewController.present(vc, animated: true, completion: completion)
    }
    
    func navigateBack(_ completion: (() -> Void)?) {
        self.initialViewController.presentedViewController?.dismiss(animated: true, completion: completion)
    }
}

extension ReleasesListFlowRouter: ReleaseViewControllerRouting {
    
}

