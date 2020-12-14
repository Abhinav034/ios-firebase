//
//  ViewShadowing.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-11-05.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class ViewShadowing: UIView {
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    func setupView(){
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4
        self.layer.cornerRadius = 5
    }

}
