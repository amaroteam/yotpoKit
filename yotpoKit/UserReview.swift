//
//  UserReview.swift
//  yotpoKit
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation
public struct UserReview {
    public var displayName          : String    = ""
    public var socialImage          : String    = ""
    public var userType             : String    = ""
    public var userId               : Int       = 0
    public var isSocialConnected    : Int       = 0
    
    public init() {}
    
    public init(nameUser:String, image: String?) {
        displayName = nameUser
        socialImage = image ?? ""
    }
    
    public init(dic:[String:AnyObject]) {
        displayName         = dic["display_name"]            as? String ?? ""
        socialImage         = dic["social_image"]            as? String ?? ""
        userType            = dic["user_type"]               as? String ?? ""
        userId              = dic["user_id"]                 as? Int ?? 0
        isSocialConnected   = dic["is_social_connected"]     as? Int ?? 0
    }
    
}
