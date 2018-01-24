//
//  SubContact.swift
//  CoreDataSample1
//
//  Created by CCS on 11/01/18.
//  Copyright © 2018 Albin Emmanuel. All rights reserved.
//

import UIKit
import ObjectMapper

class SubContact: Mappable {
    var id:String?
    var name:String?
    var email:String?
    var address:String?
    var gender:String?
    var phone:SubPhone?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map){
        id    <- map["id"]
        name    <- map["name"]
        email    <- map["email"]
        address    <- map["address"]
        gender    <- map["gender"]
        phone    <- map["phone"]
    }
}
