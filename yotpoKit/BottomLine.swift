//
//  BottomLine.swift
//  yotpoKit
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
//

import Foundation

public struct BottomLine {
    
    public var customFieldsBottomline   : String    = ""
    public var totalReview              : Int       = 0
    public var averageScore             : Float     = 0.0
    public var starDistribution         : StarDistribution  = StarDistribution()
    
    public init(){}
    
    public init(dic:[String:AnyObject]) {
        customFieldsBottomline  = dic["custom_fields_bottomline"]       as? String ?? ""
        totalReview             = dic["total_review"]                   as? Int ?? 0
        if totalReview == 0 {
            totalReview         = dic["total_reviews"]                  as? Int ?? 0
        }
        averageScore            = dic["average_score"]                  as? Float ?? 0.0
        starDistribution        = createStarDistribution(dic: dic["star_distribution"] as? [String : AnyObject] ?? [:])
    }
    
    internal func createStarDistribution(dic: [String:AnyObject])->StarDistribution {
        return StarDistribution(dic: dic)
    }
}
