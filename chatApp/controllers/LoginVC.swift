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
    @IBOutlet weak var innerView: ViewShadowing!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginWithGLE: UIButton!
    override func viewDidLoad() {
     
        loginWithFB.layer.cornerRadius = 5
        loginWithGLE.layer.cornerRadius = 5
        super.viewDidLoad()
        
        // Code for dark or light mode
        
        
        switch innerView.traitCollection.userInterfaceStyle{
              case .dark:
//                innerView.backgroundColor = .gray
                  break
              case .light:
//                innerView.backgroundColor = .white
//                registerButton.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
                
                  break
              default:
                  print("Do nothing")
              }

        
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
