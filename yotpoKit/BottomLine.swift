//
//  BottomLine.swift
//  yotpoKit
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
//

import Foundation

public struct BottomLine {
    
    public var totalReview: Int = 0
    public var averageScore: Double = 0.0
    public var starDistribution: StarDistribution = StarDistribution()
    public var isFittingScoreAvailable: Bool = false
    public var fittingScore: Double = 0.0
    public var fittingAverageScore: Double = 0.0
    public var fittingTitle: String = ""
    public var fittingveryTightLabel: String = ""
    public var fittingPerfectLabel: String = ""
    public var fittingVeryLooseLabel: String = ""
    
    public init() {}
    
    public init(dic: [String: AnyObject]) {
        totalReview  = dic["total_review"] as? Int ?? 0
        if totalReview == 0 {
            totalReview = dic["total_reviews"] as? Int ?? 0
        }
        averageScore = dic["average_score"] as? Double ?? 0.0
        
        starDistribution = createStarDistribution(dic: dic["star_distribution"] as? [String: AnyObject] ?? [:])
        
        if let dict = dic["custom_fields_bottomline"] as? [String: AnyObject] {
            if let fittingDict = dict[FittingTag.clothes.rawValue] as? [String: AnyObject] {
                fillUpFitting(fittingDict)
                fittingveryTightLabel = FittingClothesToolTip.veryTight.rawValue
                fittingPerfectLabel = FittingClothesToolTip.perfect.rawValue
                fittingVeryLooseLabel = FittingClothesToolTip.veryLoose.rawValue
            }
            
            if let fittingDict = dict[FittingTag.shoes.rawValue] as? [String: AnyObject] {
                fillUpFitting(fittingDict)
                fittingveryTightLabel = FittingShoesToolTip.veryTight.rawValue
                fittingPerfectLabel = FittingShoesToolTip.perfect.rawValue
                fittingVeryLooseLabel = FittingShoesToolTip.veryLoose.rawValue
            }
        } else {
            isFittingScoreAvailable = false
        }
    }
    
    private mutating func fillUpFitting(_ dict: [String: AnyObject]) {
        isFittingScoreAvailable = true
        fittingScore = dict["score"] as? Double ?? 0.0
        fittingAverageScore = dict["average_score"] as? Double ?? 0.0
        fittingTitle = dict["title"] as? String ?? ""
    }
    
    internal func createStarDistribution(dic: [String: AnyObject]) -> StarDistribution {
        return StarDistribution(dic: dic)
    }
}
