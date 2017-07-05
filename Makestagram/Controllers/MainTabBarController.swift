//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by Mir Ahmed on 7/4/17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    // MARK: - Properties
    
    let photoHelper = MGPhotoHelper()
    
    // viewDidLoad function here
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoHelper.completionHandler = { image in
            print("handle image")
        }
        
        delegate = self
        tabBar.unselectedItemTintColor = .black
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            // present photo taking action sheet
            photoHelper.presentActionSheet(from: self)
            return false
            
        } else {
            return true
        }
    }
}
