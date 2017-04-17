//
//  Asker.swift
//  yotpoKit
//
//  Created by Liliane Lima on 17/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation

public struct Asker {
    public var displayName          : String            = ""
    public var socialImage          : String            = ""
    public var slug                 : String            = ""
    public var bio                  : String            = ""
    public var userId               : Int               = 0
    public var score                : Int               = 0
    public var badges               : [BadgeObject]     = []
    public var isSocialConnected    : Bool              = false
    
    public init() {}
    
    public init(dic:[String:AnyObject]) {
        displayName         = dic["display_name"]            as? String ?? ""
        socialImage         = dic["social_image"]            as? String ?? ""
        slug                = dic["slug"]                    as? String ?? ""
        bio                 = dic["bio"]                     as? String ?? ""
        userId              = dic["id"]                      as? Int    ?? 0
        score               = dic["score"]                   as? Int    ?? 0
        isSocialConnected   = dic["is_social_connected"]     as? Bool   ?? false
        badges              = createBadges(fromArray: dic["badges"] as? [[String : AnyObject]] ?? [])
    }
    
    
    internal func createBadges(fromArray array: [[String:AnyObject]])->[BadgeObject] {
        var myBadges:[BadgeObject] = []
        myBadges = array.map({ (badgeDict) in
            return BadgeObject(dic: badgeDict)
        })
        
        return myBadges
    }
}
