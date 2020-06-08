//
//  MusiciansFlowRouter.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 08.06.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class MusiciansFlowRouter {
    let navigationController: UINavigationController
    let initialViewController: FavoriteMusiciansViewController
    
    init() {
        let nvc = UINavigationController()
        nvc.navigationBar.isHidden = true
        nvc.modalPresentationStyle = .fullScreen
        self.navigationController = nvc
        
        self.initialViewController = FavoriteMusiciansViewController.initFromItsStoryboard()
        self.initialViewController.router = self
        
        self.navigationController.pushViewController(self.initialViewController, animated: false)
    }
}

extension MusiciansFlowRouter: FavoriteMusiciansViewControllerRouting {
    func presentEditMusiciansViewController(_ completion: (() -> Void)?) {
        if let presentedVC = navigationController.viewControllers.first(where: { $0 is EditMusiciansViewController }) {
            navigationController.popToViewController(presentedVC, animated: true)
            return
        }
        let vc = EditMusiciansViewController.initFromItsStoryboard()
//        vc.router = self
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(vc, animated: true)
    }
    
}
