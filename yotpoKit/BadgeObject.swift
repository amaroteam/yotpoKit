//
//  BadgeObject.swift
//  yotpoKit
//
//  Created by Liliane Lima on 17/04/17.
//  Copyright © 2017 Liliane Lima . All rights reserved.
//

import Foundation

import Foundation

public struct BadgeObject {
    public var id           : Int       = 0
    public var name         : String    = ""
    public var description  : String    = ""
    public var image100     : String    = ""
    public var image300     : String    = ""
    
    public init(dic:[String:AnyObject]) {
        id              = dic["id"]             as? Int     ?? 0
        name            = dic["name"]           as? String  ?? ""
        description     = dic["description"]    as? String  ?? ""
        image100        = dic["image_100"]      as? String  ?? ""
        image300        = dic["image_300"]      as? String  ?? ""
    }
}
