//
//  Friend.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import Foundation

class Friend {

    var id:String
    var fName:String
    var lName:String
    var city:String
    var birhday:String
    var fbUrl:String
    var phoneNum:String
    var imgString:String
    
    init(fName:String, lName:String, id:String, city:String, birthday:String, fbUrl:String, phoneNum:String, img:String) {
        
        self.birhday = birthday
        self.fName = fName
        self.lName = lName
        self.id = id
        self.fbUrl = fbUrl
        self.phoneNum = phoneNum
        self.city = city
        self.imgString = img
        
        
    }
    
}
