//
//  APIYotpo.swift
//  yotpoKit
//
//  Created by Liliane Lima on 18/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation

///The API base that is reponsable to instatianciate the all the others request.
open class APIYotpo {
    
    fileprivate let appKey: String
    fileprivate let clientSecret:String
    
    public init(appK:String, clientS:String) {
        appKey = appK
        clientSecret = clientS
    }
    
    fileprivate var _myReview: MyReview?
    open var myReview: MyReview {
        if _myReview == nil {
            _myReview = MyReview(appK: appKey, clientS: clientSecret)
        }
        return _myReview!
    }
    
    fileprivate var _myQuestion: MyQuestion?
    open var myQuestion: MyQuestion {
        if _myQuestion == nil {
            _myQuestion = MyQuestion(appK: appKey, clientS: clientSecret)
        }
        return _myQuestion!
    }
    
    fileprivate var _myService: MyService?
    open var myService: MyService {
        if _myService == nil {
            _myService = MyService(appK: appKey, clientS: clientSecret)
        }
        return _myService!
    }
}
