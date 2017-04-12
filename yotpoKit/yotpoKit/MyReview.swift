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
    public typealias completionWithReviews = (_ code: Int, _ msg: String, _ reviws: [Review])->Void
    
    
    open func getReviews(product_id:String, completion: @escaping completionWithReviews) {
        Alamofire.request("\(Endpoint.getReviews.URI)\(appKey)/products/\(product_id)/reviews.json", method: Endpoint.getReviews.method).responseJSON { (response) in
            print(response)
        }
    }
}
