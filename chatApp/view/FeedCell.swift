//
//  FeedCell.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-12-25.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userID: UILabel!
    
    @IBOutlet weak var feedMessage: UILabel!
    
   

    func setValues(userImage:UIImage , id:String , message:String){
        self.userID.text = id
        self.feedMessage.text = message
        self.userImage.image = userImage
    }

}
