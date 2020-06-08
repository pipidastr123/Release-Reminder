//
//  UIStoryBoard + UIViewController.swift
//  Release Reminder
//
//  Created by Андрей Журавлев on 08.06.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

public protocol StoryboardLoadable {
    static func initFromItsStoryboard() -> Self
}

extension StoryboardLoadable where Self: UIViewController {
    
    public static func initFromItsStoryboard() -> Self {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiate(self)
        return viewController
    }
}

extension UIStoryboard {
    
    public func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard let vc = self.instantiateInitialViewController() as? VC else {
            fatalError("Couldn't instantiate \(type(of: VC.self))")
        }
        
        return vc
    }
}

extension UIViewController: StoryboardLoadable {
    
}
