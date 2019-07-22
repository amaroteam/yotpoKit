//
//  EndPoint.swift
//  yotpoKit
//
//  Created by Liliane Lima on 11/04/17.
//  Copyright © 2017 Liliane Lima . All rights reserved.
//

import Foundation
import Alamofire

struct Endpoint {
    typealias EndPointType = (URI: String, method: Alamofire.HTTPMethod)

}

//All Endpoint MyReview
extension Endpoint {
    
    static var baseUrl: String {
        get {
            switch APIYotpo.environment {
            case .dev:
                return "https://developers.yotpo.com"
            default:
                return "https://api.yotpo.com"
            }
        }
    }
    
    struct MyReview {
        static let saveReview: EndPointType = ("\(baseUrl)/v1/widget/reviews", .post)
        
        /**
         - Parameters:
            - productId: The product identification
            - appKey: The app key from yotpo
            - perPage: How many results per page
            - filter: Include filters "sort" and "direction" from Yotpo documentation
         */
        func getReviews(productId: String, appKey: String, perPage: Int, filters: RequestYotpo.Filters? = nil) -> EndPointType {
            var url = "\(baseUrl)/v1/widget/\(appKey)/products/\(productId)/reviews.json?per_page=\(perPage)"
            
            if let sort = filters?.sort, !sort.isEmpty {
                url.append("&sort=\(sort)")
            }
            if let direction = filters?.direction, !direction.isEmpty {
                url.append("&direction=\(direction)")
            }
            return (url, .get)
        }
        
        func getReviewsPage(productId: String, appKey: String, perPage: Int, page: Int) -> EndPointType {
            return ("\(baseUrl)/v1/widget/\(appKey)/products/\(productId)/reviews.json?per_page=\(perPage)&page=\(page)", .get)
        }
        
        func getResume(productId: String, appKey: String) -> EndPointType {
            return ("\(baseUrl)/products/\(appKey)/\(productId)/bottomline", .get)
        }
        
        func getReview(reviewId: String) -> EndPointType {
            return ("\(baseUrl)/reviews/\(reviewId)", .get)
        }
        
        func saveVote(reviewId: String, vote: VoteType) -> EndPointType {
            switch vote {
            case .like:
                return ("\(baseUrl)/reviews/\(reviewId)/vote/up", .get)
            case .unlike:
                return ("\(baseUrl)/reviews/\(reviewId)/vote/down", .get)
            }
        }
        func removeVoteReview(reviewId: String, vote: VoteType) -> EndPointType {
            switch vote {
            case .like:
                return ("\(baseUrl)/reviews/\(reviewId)/vote/up/true", .get)
            case .unlike:
                return ("\(baseUrl)/reviews/\(reviewId)/vote/down/true", .get)
            }
        }
    }
}

//All Endpoint MyQuestion
extension Endpoint {
    struct MyQuestion {
        static let saveQuestion: EndPointType = ("\(baseUrl)/questions/send_confirmation_mail", .post)
        
        func getQuestions(productId: String, appKey: String) -> EndPointType {
            return ("\(baseUrl)/products/\(appKey)/\(productId)/questions", .get)
        }
        
        func getQuestionPage(productId: String, appKey: String, token: String, page: Int) -> EndPointType {
            return ("\(baseUrl)/products/\(appKey)/\(productId)/questions?utoken=\(token)&page=\(page)", .get)
        }
        
        func getQuestionResume(productId: String, appKey: String) -> EndPointType {
            return ("\(baseUrl)/products/\(appKey)/\(productId)/qna_bottomline", .get)
        }
        
        func saveVoteQuestion(questionId: String, vote: VoteType) -> EndPointType {
            switch vote {
            case .like:
                return ("\(baseUrl)/answers/\(questionId)/vote/up", .get)
            case .unlike:
                return ("\(baseUrl)/answers/\(questionId)/vote/down", .get)
            }
        }
        
        func removeVoteQuestion(questionId: String, vote: VoteType) -> EndPointType {
            switch vote {
            case .like:
                return ("\(baseUrl)/answers/\(questionId)/vote/up/true", .get)
            case .unlike:
                return ("\(baseUrl)/answers/\(questionId)/vote/down/true", .get)
            }
        }
    }
}

//All Endpoint Yotpo
extension Endpoint {
    struct Yotpo {
        static let authentication: EndPointType = ("\(baseUrl)/oauth/token", .post)
    }
}

public enum VoteType {
        case like
        case unlike
}
