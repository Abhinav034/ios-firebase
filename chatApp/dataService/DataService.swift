//
//  DataService.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-11-05.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    var REF_USERS: DatabaseReference{
        return _REF_USERS
    }
    var REF_GROUPS: DatabaseReference{
        return _REF_GROUPS
    }
    var REF_FEED: DatabaseReference{
        return _REF_FEED
    }
    
    func createUser(uid:String , userData:[String:Any]){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    func createPost(message:String , uID:String , groupID:String? , sendComplete:@escaping (_ status:Bool)-> ()){
        
        if (groupID != nil){
            REF_GROUPS.childByAutoId().updateChildValues([
                "content":message,
                "sender":uID,
                "group":groupID!
            ])
        }else{
            REF_FEED.childByAutoId().updateChildValues([
                "content":message,
                "sender":uID
            ])
            sendComplete(true)
        }
        
    }
    
    func fetchDataFromFirebase(handler:@escaping (_ messages:[Message])->()){
        var transferMessages = [Message]()
        REF_FEED.observeSingleEvent(of: .value, with: { (feedMessages) in
     
            guard let allMessages = feedMessages.children.allObjects as? [DataSnapshot] else{return} // getting all obejcts from feed
            
            for messages in allMessages{
                
               let text = messages.childSnapshot(forPath: "content").value as! String
               let senderID = messages.childSnapshot(forPath: "sender").value as! String
                
                let message = Message(content: text, sender: senderID) // passsing messages to model (Message class )
                
                transferMessages.append(message)            //appending into an array
            }
            
             handler(transferMessages)      //using array as a escaping close when we use this method
        }
    )}
    
    
    
    func fetchEmailFromID (id:String , handler:@escaping (_ username:String)->()){
  
        
            REF_USERS.observeSingleEvent(of: .value) { (data) in        //getting all the data from users
            guard let alldata = data.children.allObjects as? [DataSnapshot] else {return}
                
                
        for data in alldata {
            if(data.key == id){                                     // fetching the specific id's
                handler(data.childSnapshot(forPath: "email").value as! String)      //fetching email from that specific id
            }
            }
        }

    }
    

    
}
