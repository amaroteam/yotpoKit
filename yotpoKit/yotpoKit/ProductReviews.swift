//
//  ProductReviews.swift
//  yotpoKit
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation
public struct ProductReviews {
    
    public var productTags      : String = ""
    public var groupingData     : [String] = []
    public var reviews          : [Review] = []
    public var products         : [ProductDetailReview] = []
    public var pagination       : Pagination = Pagination()
    public var bottomLine       : BottomLine = BottomLine()
    
    
    public init(dic:[String:AnyObject]) {
        productTags = dic["product_tags"] as? String ?? ""
        groupingData = dic["grouping_data"] as? [String] ?? []
        
        reviews = createReview(fromArray: dic["reviews"] as? [[String : AnyObject]] ?? [])
        products = createProduct(fromArray: dic["products"] as? [[String : AnyObject]] ?? [])
        pagination = createPagination(dic: dic["pagination"] as? [String : AnyObject] ?? [:])
        bottomLine = createBottomLine(dic: dic["bottomline"] as? [String : AnyObject] ?? [:])
    }
    
    internal func createReview(fromArray array: [[String:AnyObject]])->[Review] {
        var myReviews:[Review] = []
        myReviews = array.map({ (reviwDict) in
            return Review(dic: reviwDict)
        })

        return myReviews
    }
    
    internal func createProduct(fromArray array: [[String:AnyObject]])->[ProductDetailReview] {
        var myProducts:[ProductDetailReview] = []
        myProducts = array.map({ (prodDict) in
            return ProductDetailReview(dic: prodDict)
        })
        
        return myProducts
    }
    
    internal func createPagination(dic: [String:AnyObject])->Pagination {
        return Pagination(dic: dic)
    }
    
    internal func createBottomLine(dic: [String:AnyObject])->BottomLine {
        return BottomLine(dic: dic)
    }
    
}
