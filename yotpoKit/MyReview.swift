//
//  MyReview.swift
//  yotpoKit
//
//  Created by Liliane Lima on 11/04/17.
//  Copyright © 2017 Liliane Lima . All rights reserved.
//

import Foundation
import Alamofire

open class MyReview: RequestYotpo {
    
    //Aliases to custom closures
    public typealias completionWithReviews      = (_ code: Int, _ msg: String, _ productReviews: ProductReviews?)->Void
    public typealias completionBottomLine       = (_ code: Int, _ msg: String, _ bottomLine: BottomLine?)->Void
    public typealias completionReview           = (_ code: Int, _ msg: String, _ review: Review?)->Void
    public typealias completionReviews          = (_ code: Int, _ msg: String, _ reviews: [Review])->Void
    public typealias completionDefault          = (_ code: Int, _ msg: String)->Void
    
    
    open func getReviews(productId:String, perPage:Int = 150, completion: @escaping completionWithReviews) {
        let endPoint = Endpoint.MyReview().getReviews(productId: productId, appKey: appKey, perPage: perPage)
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String,
                    let reviewDict = JSON["response"] as? [String: AnyObject],
                    code == 200,
                    message == "OK" else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg,nil)
                        return
                }
                let productReview = ProductReviews(dic: reviewDict)
                completion(code, message, productReview)
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg, nil)
            }
        }
    }
    
    open func getReviewsPage(productId:String, perPage:Int = 150,page:Int, completion: @escaping completionReviews) {
        let endPoint = Endpoint.MyReview().getReviewsPage(productId: productId, appKey: appKey, perPage: perPage, page: page)
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String,
                    let reviewDict = JSON["response"] as? [String: AnyObject],
                    code == 200,
                    message == "OK" else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg,[])
                        return
                }
                let productReview = ProductReviews(dic: reviewDict)
                completion(code, message, productReview.reviews)
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg, [])
            }
        }
    }
    
    open func getResumeReview(productId:String, completion: @escaping completionBottomLine) {
        let endPonint = Endpoint.MyReview().getResume(productId: productId, appKey: appKey)
        Alamofire.request(endPonint.URI, method: endPonint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String,
                    let resumeDict = JSON["response"]?["bottomline"] as? [String: AnyObject],
                    code == 200  else {
                        completion(getMessage.ParsingError.code, "\(getMessage.ParsingError.msg) Confira o id do produto.",nil)
                        return
                }
                let bottomLine = BottomLine(dic: resumeDict)
                completion(code, message, bottomLine)
                
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg,nil)
            }
        }
    }
    
    open func saveVoteReview(reviewId:String, voteType:VoteType, completion: @escaping completionDefault) {
        let endPoint = Endpoint.MyReview().saveVote(reviewId: reviewId, vote: voteType)
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String,
                    let _ = JSON["response"] as? [String: AnyObject] else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg)
                        return
                }
                completion(code, message)
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg)
            }
        }
    }
    
    open func getReview(withReviewId reviewId:String,  completion: @escaping completionReview) {
        let endPoint = Endpoint.MyReview().getReview(reviewId: reviewId)
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String,
                    let reviewDict = JSON["response"]?["review"] as? [String: AnyObject] else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg, nil)
                        return
                }
                let review = Review(dic: reviewDict)
                completion(code, message, review)
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg, nil)
            }
        }
        
    }
    
    open func saveReview(post:Post, completion: @escaping completionDefault) {
        let parameter = post.convertToParameterReview(appKey: appKey)
        
        Alamofire.request(Endpoint.MyReview.saveReview.URI, method: Endpoint.MyReview.saveReview.method, parameters: parameter).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["code"] as? Int,
                    let message = JSON["message"] as? String,
                    code == 200  else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg)
                        return
                }
                completion(code, message)
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg)
            }
        }
    }
    
    open func removeVoteReview(reviewId:String,voteType:VoteType, completion: @escaping completionDefault) {
        let endPoint = Endpoint.MyReview().removeVoteReview(reviewId: reviewId, vote: voteType)
        
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String,
                    let _ = JSON["response"] as? [String: AnyObject] else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg)
                        return
                }
                completion(code, message)
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg)
            }
        }
    }
    
    
    open func getNextReview(productReview:ProductReviews, perPage:Int = 150, productId:String, completion: @escaping completionWithReviews) {
        let myOldProductReviews = productReview.reviews.filter { (review) -> Bool in
            return review.id != 0
        }
        
        var newProductReviews = productReview
        if productReview.bottomLine.totalReview > myOldProductReviews.count {
            let currentPage = myOldProductReviews.count/perPage
            
            getReviewsPage(productId: productId, perPage: perPage, page: currentPage+1, completion: { (code, msg, reviews) in
                let reviewsOrder = self.sortReviews(reviews: reviews)
                newProductReviews.reviews += reviewsOrder
                completion(200, msg, newProductReviews)
            })
        } else {
            completion(2, "There aren't reviews to download", newProductReviews)
        }
    }
    
    func sortReviews(reviews:[Review])->[Review] {
        let myReviewsOrder = reviews.sorted(by: { (review1, review2) -> Bool in
            
            if review1.score < review2.score {
                return false
            }
            
            if review1.score > review2.score {
                return true
            }
            
            if review1.score == review2.score {
                
                return review1.votesUp > review2.votesUp
                
            }
            
            return false
            
        })
        
        return myReviewsOrder
    }
    
    
}
