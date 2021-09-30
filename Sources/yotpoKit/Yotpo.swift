//
//  Yotpo.swift
//  yotpoKit
//
//  Created by Liliane Lima on 09/05/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
//

import Foundation
import Alamofire

open class Yotpo: RequestYotpo {
    
    open var myQuestion: MyQuestion
    open var myReview: MyReview
    
    //Aliases to custom closures
    public typealias CompletionWithToken = (_ code: Int, _ msg: String, _ token: String?) -> Void
    public typealias CompletionWithProductYotpo = (_ code: Int, _ msg: String, _ productYotpo: ProductYotpo) -> Void
    
    override init(appK: String, clientS: String, token: String = "") {
        myQuestion = MyQuestion(appK: appK, clientS: clientS, token: "")
        myReview   = MyReview(appK: appK, clientS: clientS, token: "")
        super.init(appK: appK, clientS: clientS, token: token)
    }
    
    fileprivate func initQuestion(token: String) {
        self.myQuestion = MyQuestion(appK: appKey, clientS: clientSecret, token: token)
        self.myReview = MyReview(appK: appKey, clientS: clientSecret, token: token)
    }
    
    open func requestToken() {
        let parameter = [
            "client_id": appKey,
            "client_secret": clientSecret,
            "grant_type": "client_credentials"
        ]
        
        AF.request(Endpoint.Yotpo.authentication.URI, method: Endpoint.Yotpo.authentication.method, parameters: parameter).responseJSON { (response) in
            switch response.result {
            case .success(let data):

                guard let JSON = data as? [String: AnyObject] else {
                    return
                }
                
                if let token = JSON["access_token"] as? String {
                    self.initQuestion(token: token)
                }
                
            case .failure:
                return
            }
        }
        
    }
 
    open func getProductYotpo(productId: String, perPage: Int = 150, _ completion: @escaping CompletionWithProductYotpo) {
        var questionProcess = false
        var reviewProcess = false
        var myProductYotpo = ProductYotpo()
        var messageResult = ""
        myQuestion.getQuestions(productId: productId) { (code, msg, questionResult) in
            messageResult +=  "\nQuestions: \(msg)"
            
            questionProcess = true
            if let prodQuestion = questionResult {
                myProductYotpo.productQuestion = prodQuestion
            }
            if reviewProcess && questionProcess {
                completion(code, messageResult, myProductYotpo)
            }

        }
        myReview.getReviews(productId: productId, perPage: perPage) { (code, msg, reviewResult) in
            messageResult +=  "\nProduct: \(msg)"
            
            reviewProcess = true
            if let prodReview = reviewResult {
                myProductYotpo.productReviews = prodReview
            }
            if reviewProcess && questionProcess {
                completion(code, messageResult, myProductYotpo)
            }
        }
    }
}
