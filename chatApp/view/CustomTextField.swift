//
//  CustomTextField.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-11-05.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        configurePlaceHolder()
        super.awakeFromNib()
    }
    
    
    func configurePlaceHolder(){
        let color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let placeholder = NSAttributedString(string: self.placeholder!, attributes:
            [NSMutableAttributedString.Key.foregroundColor: color])
        self.attributedPlaceholder = placeholder
    }
    
}
