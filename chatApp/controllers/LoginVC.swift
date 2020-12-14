//
//  LoginVC.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-11-05.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginWithFB: UIButton!
    @IBOutlet weak var loginWithGLE: UIButton!
    override func viewDidLoad() {
     
        loginWithFB.layer.cornerRadius = 5
        loginWithGLE.layer.cornerRadius = 5
        super.viewDidLoad()

        
    }
    

    @IBAction func loginWithFBTapped(_ sender: UIButton) {
    }
    

    @IBAction func loginWithGLETapped(_ sender: UIButton) {
    }
    @IBAction func loginWithMailTapped(_ sender: UIButton) {
        
        let signInVC = storyboard?.instantiateViewController(identifier: "SignInVC")
        present(signInVC!, animated: true, completion: nil)
        
    }
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let signInVC = storyboard?.instantiateViewController(identifier: "SignInVC") as! SignInVC
        signInVC.viaRegiter = true
        present(signInVC, animated: true, completion: nil)
        
    }
}
