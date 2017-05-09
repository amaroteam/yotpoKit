//
//  Post.swift
//  yotpoKit
//
//  Created by Liliane Lima on 13/04/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
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
    public var reviewScore          : Int       = 0

    
    public init(){}
    
    public init(PostReviewWithSku sku:String, productTitle: String, productUrl:String, displayName:String, email:String, postTitle:String, postDescription:String, reviewScore:Int) {
        self.sku            = sku
        self.productTitle   = productTitle
        self.productUrl     = productUrl
        self.displayName    = displayName
        self.email          = email
        self.reviewContent  = postDescription
        self.reviewTitle    = postTitle
        self.reviewScore    = reviewScore
    }
    
    public init(PostQuestionWithSku sku :String, productTitle: String, productUrl:String, displayName:String, email:String, question:String) {
        self.sku            = sku
        self.productTitle   = productTitle
        self.productUrl     = productUrl
        self.displayName    = displayName
        self.email          = email
        self.reviewContent  = question
    }
    
    func convertToParameterReview(appKey:String)->[String:Any] {
        let parameter = [
            "appkey"        :appKey,
            "sku"           :self.sku,
            "product_title" :self.productTitle,
            "product_url"   :self.productUrl,
            "display_name"  :self.displayName,
            "email"         :self.email,
            "review_content":self.reviewContent,
            "review_title"  :self.reviewTitle,
            "review_score"  :self.reviewScore,
            "review_source" :"widget_v2"
            ] as [String : Any]
        
        return parameter
    }
    
    func convertToParameterQuestion(appKey:String)->[String:Any] {
        let parameter = [
            "appkey"        :appKey,
            "sku"           :self.sku,
            "product_title" :self.productTitle,
            "product_url"   :self.productUrl,
            "display_name"  :self.displayName,
            "email"         :self.email,
            "review_content":self.reviewContent,
            ] as [String : Any]
        
        return parameter
    }
    
    
}
