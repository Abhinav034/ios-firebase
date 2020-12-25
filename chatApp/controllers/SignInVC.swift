//
//  SignInVC.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-11-05.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: CustomTextField!
    
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var signInLogInButton: UIButton!
    
    var viaRegiter:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch traitCollection.userInterfaceStyle {
        case .dark:
            
            break
        case .light:
            break
        default:
            print("Do nothing")
        }
        
        if (viaRegiter){
            signInLogInButton.setTitle("Register", for: .normal)
        }
    }
    func alert(title:String , message:String , actionOK:Bool){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            if (actionOK){
               self.dismiss(animated: true, completion: nil)
            }
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if (signInLogInButton.titleLabel?.text == "Register"){
            
            AuthService.instance.registerUser(email: email!, password: password!) { (success, error) in
                if (success){
                    self.alert(title: "Success!", message: "Please login again!" , actionOK: true)
                    
                }else{
                    self.alert(title: "Error!", message: "Check email/password" , actionOK: false)
                }
            }
            
        }else{
            AuthService.instance.loginUser(email: email!, password: password!) { (success, error) in
                if (success){
                    self.dismiss(animated: true, completion: nil)
                }else{
                    self.alert(title: "Error!", message: "Check email/password" , actionOK: false)
                    
                }
            }
        }
    }
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

