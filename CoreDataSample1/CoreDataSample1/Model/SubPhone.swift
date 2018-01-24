//
//  SubPhone.swift
//  CoreDataSample1
//
//  Created by CCS on 11/01/18.
//  Copyright © 2018 Albin Emmanuel. All rights reserved.
//

import UIKit
import ObjectMapper

class SubPhone: Mappable {
    var mobile:String?
    var home:String?
    var office:String?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map){
        mobile    <- map["mobile"]
        home    <- map["home"]
        office    <- map["office"]
    }
}
