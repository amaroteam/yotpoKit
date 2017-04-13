//
//  MyReview.swift
//  yotpoKit
//
//  Created by Liliane Lima on 11/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation
import Alamofire

open class MyReview: Request {
    
    //Aliases to custom closures
    public typealias completionWithReviews = (_ code: Int, _ msg: String, _ productReviews: ProductReviews?)->Void
    public typealias completionDefault     = (_ code: Int, _ msg: String)->Void
    
    
    open func getReviews(productId:String, perPage:Int = 150, completion: @escaping completionWithReviews) {
        let endPoint = Endpoint().getReviews(productId: productId, appKey: appKey, perPage: perPage)
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
    
    open func getReviewsPage(productId:String, perPage:Int = 150,page:Int, completion: @escaping completionWithReviews) {
        let endPoint = Endpoint().getReviewsPage(productId: productId, appKey: appKey, perPage: perPage, page: page)
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
    
    open func saveVoteReview(reviewId:String, voteType:VoteType, completion: @escaping completionDefault) {
        let endPoint = Endpoint().saveVote(reviewId: reviewId, vote: voteType)
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String,
                    code == 200,
                    message == "OK" else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg)
                        return
                }
                completion(code, message)
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg)
            }
        }
    }
    
    open func saveReview(post:Post, completion: @escaping completionDefault) {
        let parameter = convertPostToParameter(post: post)
        
        Alamofire.request(Endpoint.saveReview.URI, method: Endpoint.saveReview.method, parameters: parameter).responseJSON { (response) in
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
    
    
    func convertPostToParameter(post:Post)->[String:Any] {
        let parameter = [
            "appkey"        :appKey,
            "sku"           :post.sku,
            "product_title" :post.productTitle,
            "product_url"   :post.productUrl,
            "display_name"  :post.displayName,
            "email"         :post.email,
            "review_content":post.reviewContent,
            "review_title"  :post.reviewTitle,
            "review_score"  :post.reviewScore,
            "review_source" :"widget_v2"
        ] as [String : Any]
        
        return parameter
    }
    
     
}
