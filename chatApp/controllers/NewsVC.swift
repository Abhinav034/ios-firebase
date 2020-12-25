//
//  FirstViewController.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-11-05.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit


class NewsVC: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DataService.init().fetchDataFromFirebase { (data) in        //fetching from database and using escaping closure
            self.messages = data.reversed()                         //putting data into local messages array
                self.tableView.reloadData()
            }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedCell
        
        DataService.init().fetchEmailFromID(id: messages[indexPath.row].sender) { (data) in     // here i am using my own function which converts raw id's to emails
            
            cell.setValues(userImage: UIImage(named: "defaultProfileImage")!, id: data , message:
                self.messages[indexPath.row].content)
        }
       
        
        
        return cell
       }

}

