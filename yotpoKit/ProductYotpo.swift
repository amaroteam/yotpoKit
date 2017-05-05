//
//  ProductYotpo.swift
//  yotpoKit
//
//  Created by Liliane Lima on 02/05/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
//

import Foundation

public struct ProductYotpo {
    
    public var productQuestion : ProductQuestion = ProductQuestion()
    public var productReviews  : ProductReviews  = ProductReviews()
    
    public init(){}
    
    public init(reviews:ProductReviews,questions:ProductQuestion) {
        productQuestion = questions
        productReviews  = reviews
    }
    

    

}
