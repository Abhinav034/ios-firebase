//
//  PostVC.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-12-14.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit
import Firebase
class PostVC: UIViewController {
    
   
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textView.delegate = self
        
        userNameLabel.text = Auth.auth().currentUser?.email
        userImageView.image = UIImage(named: "defaultProfileImage")
        
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        if (textView.text != nil && textView.text != "Write something here..."){
            sendButton.isEnabled = false
            DataService.init().createPost(message: textView.text, uID: Auth.auth().currentUser!.uid, groupID: nil) { (completed) in
                if completed{
                    self.dismiss(animated: true, completion: nil)
                }else{
                    
                    self.sendButton.isEnabled = true
                    print("Error sending message")
                    
                }
            }
            
        }
        
    }
    
}

extension PostVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.textView.text = ""
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n"){
         
            
            self.textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textView.resignFirstResponder()
    }
    
    
    
}
