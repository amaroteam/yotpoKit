//
//  EndPoint.swift
//  yotpoKit
//
//  Created by Liliane Lima on 11/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation
import Alamofire

struct Endpoint {
    typealias endPointType       = (URI: String, method: Alamofire.HTTPMethod)
}

extension Endpoint {
    static let create : endPointType = ("https://api.yotpo.com/v1/widget/reviews", .post)
    static let getReviews : endPointType = ("https://api.yotpo.com/v1/widget/", .get)
    static let getReviewsPage : endPointType = ("https://api.yotpo.com/products/", .get)
}
