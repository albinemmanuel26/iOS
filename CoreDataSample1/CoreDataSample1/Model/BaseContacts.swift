//
//  BaseContacts.swift
//  CoreDataSample1
//
//  Created by CCS on 11/01/18.
//  Copyright © 2018 Albin Emmanuel. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseContacts: Mappable {
    var contacts:[SubContact]?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map){
        contacts    <- map["contacts"]
    }
}
