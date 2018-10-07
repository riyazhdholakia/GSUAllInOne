//
//  LoginSignUpViewController.swift
//  GSUAllInOne
//
//  Created by Riyazh Dholakia on 10/6/18.
//  Copyright © 2018 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase

class LoginSignUpViewController: UIViewController {
    
    @IBOutlet weak var submitButtonLabel: UIButton!
    @IBOutlet weak var loginButtonLabel: UIButton!
    @IBOutlet weak var signUpButtonLabel: UIButton!
    @IBOutlet weak var emailTextFieldLabel: UITextField!
    @IBOutlet weak var passwordTextFieldLabel: UITextField!
    @IBOutlet weak var phoneNumberTextFieldLabel: UITextField!
    @IBOutlet weak var nameTextFieldLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTextFieldLabel.isHidden = true
        nameTextFieldLabel.isHidden = true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func onLoginPressed(_ sender: Any) {
        phoneNumberTextFieldLabel.isHidden = true
        nameTextFieldLabel.isHidden = true
    }
    @IBAction func onSignUpPressed(_ sender: Any) {
        phoneNumberTextFieldLabel.isHidden = false
        nameTextFieldLabel.isHidden = false
    }
    @IBAction func onSubmitPressed(_ sender: Any) {
        if nameTextFieldLabel.isHidden == true {
            if emailTextFieldLabel.text != nil, passwordTextFieldLabel.text != nil {
                
                Auth.auth().signIn(withEmail: emailTextFieldLabel.text!, password: passwordTextFieldLabel.text!) { (result, error) in
                    
                    switch result {
                    case .none:
                        NotificationCenter.default.post(name: logMeinNotification, object: nil)
                        self.dismiss(animated: true, completion: nil)
                    case .some(_):
                        print(error)
                    }
                    
//                    switch result {
//
//                    case .success(_):
//                        NotificationCenter.default.post(name: logMeinNotification, object: nil)
//                        self.dismiss(animated: true, completion: nil)
//                    case .failure(let error!):
//                        print(error)
                    //}
                }
            } else {
                if passwordTextFieldLabel.text != nil {
                    if nameTextFieldLabel != nil {
                        if emailTextFieldLabel != nil {
                            Auth.auth().createUser(withEmail: emailTextFieldLabel.text!, password: passwordTextFieldLabel.text!) { (result, error) in
                                switch result {
                                case .none:
                                    NotificationCenter.default.post(name: logMeinNotification, object: nil)
                                        self.dismiss(animated: true, completion: nil)
                                case .some(_):
                                    print(error)
                                }
                            }
                            
                            
//                            Auth.auth().createUser(withEmail: emailTextFieldLabel.text!, password: passwordTextFieldLabel.text!, completion: { (result) in
//                                switch result {
//                                case .success(_):
//                                    NotificationCenter.default.post(name: logMeinNotification, object: nil)
//                                    self.dismiss(animated: true, completion: nil)
//                                case .failure(let error):
//                                    print(error)
//                                }
//                            })
                        }
                    }
                }
                
            }
        }
        
        
    }
}
