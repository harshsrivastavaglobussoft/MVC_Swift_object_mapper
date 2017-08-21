//
//  MainArrayModel.swift
//  DribbleInSwift
//
//  Created by Sumit Ghosh on 21/08/17.
//  Copyright © 2017 Sumit Ghosh. All rights reserved.
//
import UIKit
import ObjectMapper

class MainArrayModel: Mappable {
    var id:NSString!
    var teaser:NSString!
    var hidpi:NSString!
    var normal:NSString!
    var name:NSString!
    var location:NSString!
    var avatar_url:NSString!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id         <- map["id"]
        teaser     <- map["images.teaser"]
        hidpi      <- map["images.hidpi"]
        normal     <- map["images.normal"]
        name       <- map["user.name"]
        location   <- map["user.location"]
        avatar_url <- map["user.avatar_url"]
    }

}
