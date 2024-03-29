//
//  Review.swift
//  yotpoKit
//
//  Created by Liliane Lima on 11/04/17.
//  Copyright © 2017 Liliane Lima . All rights reserved.
//

import Foundation

public struct Review {

    public var content: String = ""
    public var title: String = ""
    public var createdAt: Date = Date()
    public var sourceReviewId: String = ""
    public var customFields: String = ""
    public var productId: Int = 0
    public var id: Int = 0
    public var score: Int = 0
    public var votesUp: Int = 0
    public var votesDown: Int = 0
    public var verifiedBuyer: Bool = false
    public var user: UserReview = UserReview()
    public var isFittingScoreAvailable: Bool = false
    public var fittingScore: Double = 0.0
    public var fittingTitle: String = ""
    
    public init() {}
    
    public init(titleReview: String, contentReview: String, dateCreated: Date, productID: Int, scoreReview: Int, 
                userReview: UserReview, voteUp: Int, voteDown: Int) {
        content = contentReview
        title = titleReview
        createdAt = dateCreated
        productId = productID
        score = scoreReview
        user = userReview
        votesUp = voteUp
        votesDown = voteDown
    }
    
    public init(dic: [String: AnyObject]) {
        content = dic["content"] as? String ?? ""
        title = dic["title"] as? String ?? ""
        sourceReviewId = dic["source_review_id"] as? String ?? ""
        customFields = dic["custom_fields"] as? String ?? ""
        productId = dic["product_id"] as? Int ?? 0
        id = dic["id"] as? Int ?? 0
        score = dic["score"] as? Int ?? 0
        votesUp = dic["votes_up"] as? Int ?? 0
        votesDown = dic["votes_down"] as? Int ?? 0
        verifiedBuyer = dic["verified_buyer"] as? Bool ?? false
        user = createUser(dic: dic["user"] as? [String: AnyObject] ?? [:])
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let dateString = dic["created_at"] as? String,
            let daten = dateFormatter.date(from: dateString) {
            self.createdAt = daten
        }
        
        if let dict = dic["custom_fields"] as? [String: AnyObject] {
            if let fittingDict = dict[FittingTag.clothes.rawValue] as? [String: AnyObject] {
                fillUpFitting(fittingDict)
            }
            
            if let fittingDict = dict[FittingTag.shoes.rawValue] as? [String: AnyObject] {
                fillUpFitting(fittingDict)
            }
            
        } else {
            isFittingScoreAvailable = false
        }
    }
    
    private mutating func fillUpFitting(_ dict: [String: AnyObject]) {
        isFittingScoreAvailable = true
        fittingScore = dict["value"] as? Double ?? 0.0
        fittingTitle = dict["title"] as? String ?? ""
    }
    
    internal func createUser(dic: [String: AnyObject]) -> UserReview {
        return UserReview(dic: dic)
    }
}
