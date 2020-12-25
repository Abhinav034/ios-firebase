//
//  message.swift
//  chatApp
//
//  Created by Abhinav Bhardwaj on 2020-12-25.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import Foundation

class Message {
    
    private var _content: String
    private var _sender:String
    
    var content:String {
        return _content
    }
    var sender:String {
        return _sender
    }
    
    init(content:String , sender:String){
        self._content = content
        self._sender = sender
    }
    
}
