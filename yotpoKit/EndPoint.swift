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
    struct MyReview {
        static let saveReview: EndPointType = ("https://api.yotpo.com/v1/widget/reviews", .post)
        
        func getReviews(productId: String, appKey: String, perPage: Int) -> EndPointType {
            return ("https://api.yotpo.com/v1/widget/\(appKey)/products/\(productId)/reviews.json?per_page=\(perPage)", .get)
        }
        
        func getReviewsPage(productId: String, appKey: String, perPage: Int, page: Int) -> EndPointType {
            return ("https://api.yotpo.com/v1/widget/\(appKey)/products/\(productId)/reviews.json?per_page=\(perPage)&page=\(page)", .get)
        }
        
        func getResume(productId: String, appKey: String) -> EndPointType {
            return ("https://api.yotpo.com/products/\(appKey)/\(productId)/bottomline", .get)
        }
        
        func getReview(reviewId: String) -> EndPointType {
            return ("https://api.yotpo.com/reviews/\(reviewId)", .get)
        }
        
        func saveVote(reviewId: String, vote: VoteType) -> EndPointType {
            switch vote {
            case .like:
                return ("https://api.yotpo.com/reviews/\(reviewId)/vote/up", .get)
            case .unlike:
                return ("https://api.yotpo.com/reviews/\(reviewId)/vote/down", .get)
            }
        }
        func removeVoteReview(reviewId: String, vote: VoteType) -> EndPointType {
            switch vote {
            case .like:
                return ("https://api.yotpo.com/reviews/\(reviewId)/vote/up/true", .get)
            case .unlike:
                return ("https://api.yotpo.com/reviews/\(reviewId)/vote/down/true", .get)
            }
        }
    }
}

//All Endpoint MyQuestion
extension Endpoint {
    struct MyQuestion {
        static let saveQuestion: EndPointType = ("https://api.yotpo.com/questions/send_confirmation_mail", .post)
        
        func getQuestions(productId: String, appKey: String) -> EndPointType {
            return ("https://api.yotpo.com/products/\(appKey)/\(productId)/questions", .get)
        }
        
        func getQuestionPage(productId: String, appKey: String, token: String, page: Int) -> EndPointType {
            return ("https://api.yotpo.com/products/\(appKey)/\(productId)/questions?utoken=\(token)&page=\(page)", .get)
        }
        
        func getQuestionResume(productId: String, appKey: String) -> EndPointType {
            return ("https://api.yotpo.com/products/\(appKey)/\(productId)/qna_bottomline", .get)
        }
        
        func saveVoteQuestion(questionId: String, vote: VoteType) -> EndPointType {
            switch vote {
            case .like:
                return ("https://api.yotpo.com/answers/\(questionId)/vote/up", .get)
            case .unlike:
                return ("https://api.yotpo.com/answers/\(questionId)/vote/down", .get)
            }
        }
        
        func removeVoteQuestion(questionId: String, vote: VoteType) -> EndPointType {
            switch vote {
            case .like:
                return ("https://api.yotpo.com/answers/\(questionId)/vote/up/true", .get)
            case .unlike:
                return ("https://api.yotpo.com/answers/\(questionId)/vote/down/true", .get)
            }
        }
    }
}

//All Endpoint Yotpo
extension Endpoint {
    struct Yotpo {
        static let authentication: EndPointType = ("https://api.yotpo.com/oauth/token", .post)
    }
}

public enum VoteType {
        case like
        case unlike
}
