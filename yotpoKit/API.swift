//
//  API.swift
//  yotpoKit
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation

///The API base that is reponsable to instatianciate the all the others request.
open class API {
    //fileprivate let appKey = Request().appKey
    
    public init() {
    }
    
    fileprivate var _myReview: MyReview?
    open var myReview: MyReview {
        if _myReview == nil {
            _myReview = MyReview()
        }
        return _myReview!
    }
}
