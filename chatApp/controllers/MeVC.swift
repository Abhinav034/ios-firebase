//
//  MeVC.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-12-25.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit
import Firebase
class MeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

  
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Logout ?", message: "Are you sure ?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (tapped) in
                  //do nothing
              }))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (tapped) in
            do{
                try Auth.auth().signOut()
                
                let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
                loginVC.modalPresentationStyle = .fullScreen
                self.present(loginVC, animated: true, completion: nil)
                
            }catch{
                print(error)
            }
        }))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}
