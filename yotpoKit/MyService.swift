//
//  MyService.swift
//  yotpoKit
//
//  Created by Liliane Lima on 17/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation
import Alamofire

open class MyService: RequestYotpo {
    
    //Aliases to custom closures
    public typealias completionWithToken = (_ code: Int, _ msg: String, _ token: String?)->Void
    public typealias completionWithProductYotpo = (_ code: Int, _ msg: String, _ productYotpo: ProductYotpo)->Void
    public typealias completionWithReviews      = (_ code: Int, _ msg: String, _ productReviews: ProductReviews?)->Void
    public typealias completionWithQuestions    = (_ code: Int, _ msg: String, _ productQuestion: ProductQuestion?)->Void
    
    
    open func requestToken(_ completion: @escaping completionWithToken) {
        let parameter = [
            "client_id"     :appKey,
            "client_secret" : clientSecret,
            "grant_type"    : "client_credentials"
        ]
        
        Alamofire.request(Endpoint.MyService.authentication.URI, method: Endpoint.MyService.authentication.method, parameters: parameter).responseJSON { (response) in
            switch response.result {
            case .success:
                
                guard let JSON = response.result.value as? [String: AnyObject] else {
                    completion(getMessage.ParsingError.code, getMessage.ParsingError.msg, nil)
                    return
                }
                
                if let token = JSON["access_token"] as? String {
                    completion(getMessage.Success.code, getMessage.Success.msg, token)
                } else if let code = JSON["status"]?["code"] as? Int, let message = JSON["status"]?["message"] as? String {
                    completion(code, message, nil)
                } else {
                    completion(getMessage.ParsingError.code, getMessage.ParsingError.msg, nil)
                }
                
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg, nil)
            }
        }
    }
    
    open func getProductYotpo(productId:String, _ completion: @escaping completionWithProductYotpo) {
        var questionProcess = false
        var reviewProcess = false
        var myProductYotpo = ProductYotpo()
        
        getReviews(productId: productId) { (code, msg, result) in
            reviewProcess = true
            if let prodReview = result {
                myProductYotpo.productReviews = prodReview
            }
            if reviewProcess && questionProcess {
                completion(code, msg, myProductYotpo)
            }
        }
        
        getQuestions(productId: productId) { (code, msg, result) in
            questionProcess = true
            if let prodQuestion = result {
                myProductYotpo.productQuestion = prodQuestion
            }
            if reviewProcess && questionProcess {
                completion(code, msg, myProductYotpo)
            }
        }
        
    
    }
    
    private func getReviews(productId:String, perPage:Int = 150, completion: @escaping completionWithReviews) {
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
    
    private func getQuestions(productId:String, completion: @escaping completionWithQuestions) {
        let endPoint = Endpoint.MyQuestion().getQuestions(productId: productId, appKey: appKey)
        
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg,nil)
                        return
                }
                
                if code == 200 {
                    guard let questionDict = JSON["response"] as? [String: AnyObject] else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg,nil)
                        return
                    }
                    
                    let productQ = ProductQuestion(dic: questionDict)
                    completion(code, message, productQ)
                    
                } else {
                    completion(code, message, nil)
                }
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg, nil)
            }
        }
    }
    
    
}
