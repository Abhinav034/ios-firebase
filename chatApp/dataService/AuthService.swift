//
//  AuthService.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-11-16.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import Foundation
import Firebase


class AuthService {
    
   static let instance = AuthService()
    let firebase = Auth.auth()
    
    func registerUser(email: String , password:String , creationComplete:@escaping (_ _status:Bool , _ _error:Error?)->()){
        
       firebase.createUser(withEmail: email, password: password) { (result, error) in
            guard let user = result else {
                creationComplete(false , error)
                return
            }
            let userData = ["provider":user.additionalUserInfo?.providerID , "email":user.user.email]
            DataService.instance.createUser(uid:user.user.uid , userData: userData)
            creationComplete(true , nil)
        }
    }
    
    
    func loginUser(email: String , password:String , loginComplete:@escaping (_ _status:Bool , _ _error:Error?)->()){
        firebase.signIn(withEmail: email, password: password) { (result, error) in
            if(error != nil){
                loginComplete(false , error)
                return
            }
                loginComplete(true , nil)
            
        }
    }
}
