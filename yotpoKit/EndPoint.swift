//
//  EndPoint.swift
//  yotpoKit
//
//  Created by Liliane Lima on 11/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation
import Alamofire

struct Endpoint {
    typealias EndPointType       = (URI: String, method: Alamofire.HTTPMethod)

}

extension Endpoint {
    func getReviews(productId:String, appKey:String, perPage:Int)->EndPointType {
        return ("https://api.yotpo.com/v1/widget/\(appKey)/products/\(productId)/reviews.json?per_page=\(perPage)", .get)
    }
    
    func getReviewsPage(productId:String, appKey:String, perPage:Int, page:Int)->EndPointType {
        return ("https://api.yotpo.com/v1/widget/\(appKey)/products/\(productId)/reviews.json?per_page=\(perPage)?page=\(page)", .get)
    }
    
    func saveVote(reviewId:String,vote: VoteType)->EndPointType {
        switch vote {
        case .like:
            return ("https://api.yotpo.com/reviews/\(reviewId)/vote/up", .get)
        case .unlike:
            return ("https://api.yotpo.com/reviews/\(reviewId)/vote/down", .get)
        }
    }
}

public enum VoteType {
        case like
        case unlike
}
