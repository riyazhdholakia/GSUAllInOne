//
//  RootNavigationController.swift
//  GSUAllInOne
//
//  Created by Riyazh Dholakia on 10/6/18.
//  Copyright © 2018 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase

let logMeinNotification = Notification.Name("LogMeInDidCompleteNotification")

class RootNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 39/255, blue: 144/255, alpha: 1)
    
        if Auth.auth().currentUser == nil {
        
            NotificationCenter.default.addObserver(forName: logMeinNotification, object: nil, queue: .main) { (_) in
                let loginVC = self.presentedViewController as? LoginSignUpViewController
                loginVC?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "LoginViewController")
            present(loginVC, animated: animated, completion: nil)
        }
    }
    
}
