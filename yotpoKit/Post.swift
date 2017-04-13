//
//  Post.swift
//  yotpoKit
//
//  Created by Liliane Lima on 13/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation

public struct Post {
    public var sku                  : String    = ""
    public var productTitle         : String    = ""
    public var productDescription   : String    = ""
    public var productUrl           : String    = ""
    public var productImageUrl      : String    = ""
    public var displayName          : String    = ""
    public var email                : String    = ""
    public var reviewContent        : String    = ""
    public var reviewTitle          : String    = ""
    public var domain               : String    = ""
    public var reviewScore          : Int       = 0

    
    public init(){}
    
    public init(sku:String, productTitle: String, productUrl:String, displayName:String, email:String, reviewTitle:String, reviewDescription:String, reviewScore:Int) {
        self.sku            = sku
        self.productTitle   = productTitle
        self.productUrl     = productUrl
        self.displayName    = displayName
        self.email          = email
        self.reviewContent  = reviewDescription
        self.reviewTitle    = reviewTitle
        self.reviewScore    = reviewScore
    }
    
}
