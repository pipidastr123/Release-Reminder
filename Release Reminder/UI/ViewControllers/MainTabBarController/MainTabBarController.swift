//
//  MainTabBarController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 08.06.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let releasesRouter = ReleasesListFlowRouter()
    let musiciansRouter = MusiciansFlowRouter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let releasesVC = releasesRouter.navigationController
        let musiciansVC = musiciansRouter.navigationController
        
        UserManager.shared.setToken()
                
        viewControllers = [
            generateNavigationController(root: releasesVC, title: "Releases", image: UIImage(systemName: "music.note.list")!),
            generateNavigationController(root: musiciansVC, title: "Favorite Musicians", image: UIImage(systemName: "heart.fill")!)
        ]
    }
    
    private func generateNavigationController(root: UIViewController, title: String, image: UIImage) -> UIViewController {
        guard let navigationVC = root as? UINavigationController else {
            return UIViewController()
        }
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
