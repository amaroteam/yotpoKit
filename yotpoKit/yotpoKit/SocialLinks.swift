//
//  SocialLinks.swift
//  yotpoKit
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation

public struct SocialLinks {
    public var facebook         : String    = ""
    public var twitter          : String    = ""
    public var linkedin         : String    = ""
    public var googleOauth2     : String    = ""
    
    public init(){}
    
    public init(dic:[String:AnyObject]) {
        facebook        = dic["facebook"]       as? String ?? ""
        twitter         = dic["twitter"]        as? String ?? ""
        linkedin        = dic["linkedin"]       as? String ?? ""
        googleOauth2    = dic["google_oauth2"]  as? String ?? ""
        
    }
    
}
