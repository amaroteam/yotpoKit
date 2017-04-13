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
    
    open func saveVote(reviewId:String, voteType:VoteType, completion: @escaping completionDefault) {
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
    
     
}
