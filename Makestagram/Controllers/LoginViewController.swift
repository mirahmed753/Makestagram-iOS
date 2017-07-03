//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Mir Ahmed on 6/30/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

// typealias aliasName = existingType
typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    // PROPERTIES (VARS)
    @IBOutlet weak var loginButton: UIButton!
    
    // VC LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // do any additional set up after loading the view
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // dispose of any resources that can be recreated
    }
    
    // ACTIONS
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // 1
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // 2
        authUI.delegate = self
        
        // 3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?)
    {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        // 1
        guard let user = user
            else { return }
        // 2
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                // handle existing user
                User.setCurrent(user)
                
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else {
                // handle new user
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        }

    }
}
