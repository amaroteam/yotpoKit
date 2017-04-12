//
//  Review.swift
//  yotpoKit
//
//  Created by Liliane Lima on 11/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation

public struct Review {
    
//    public var sku                  : String    = ""
//    public var productTitle         : String    = ""
//    public var productDescription   : String    = ""
//    public var productUrl           : String    = ""
//    public var productImageUrl      : String    = ""
//    public var displayName          : String    = ""
//    public var email                : String    = ""
//    public var reviewContent        : String    = ""
//    public var reviewTitle          : String    = ""
//    public var reviewScore          : Int       = 0
    
    
    
    
    public var content          : String        = ""
    public var title            : String        = ""
    public var createdAt        : String        = ""
    public var sourceReviewId   : String        = ""
    public var customFields     : String        = ""
    public var productId        : Int           = 0
    public var id               : Int           = 0
    public var score            : Int           = 0
    public var votesUp          : Int           = 0
    public var votesDown        : Int           = 0
    public var verifiedBuyer    : Bool          = false
    public var user             : UserReview    = UserReview()
    
    public init(dic:[String:AnyObject]) {
        content         = dic["content"]            as? String ?? ""
        title           = dic["title"]              as? String ?? ""
        createdAt       = dic["created_at"]         as? String ?? ""
        sourceReviewId  = dic["source_review_id"]   as? String ?? ""
        customFields    = dic["custom_fields"]      as? String ?? ""
        productId       = dic["product_id"]         as? Int ?? 0
        id              = dic["id"]                 as? Int ?? 0
        score           = dic["score"]              as? Int ?? 0
        votesUp         = dic["votes_up"]           as? Int ?? 0
        votesDown       = dic["votes_down"]         as? Int ?? 0
        verifiedBuyer   = dic["verified_buyer"]     as? Bool ?? false
        user            = createUser(dic: dic["user"] as? [String : AnyObject] ?? [:])
        
    }
    
    internal func createUser(dic: [String:AnyObject])->UserReview {
        return UserReview(dic: dic)
    }

}
