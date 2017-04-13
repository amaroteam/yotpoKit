//
//  ProductDetailReview.swift
//  yotpoKit
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation

public struct ProductDetailReview {
    public var domainKey                : String        = ""
    public var name                     : String        = ""
    public var embeddedWidgetLink       : String        = ""
    public var testimonialsProductLink  : String        = ""
    public var productLink              : String        = ""
    public var id                       : Int           = 0
    public var socialLinks              : SocialLinks   = SocialLinks()
    
    public init() {}
    
    public init(dic:[String:AnyObject]) {
        domainKey                   = dic["domain_key"]                 as? String ?? ""
        name                        = dic["name"]                       as? String ?? ""
        embeddedWidgetLink          = dic["embedded_widget_link"]       as? String ?? ""
        testimonialsProductLink     = dic["testimonials_product_link"]  as? String ?? ""
        productLink                 = dic["product_link"]               as? String ?? ""
        id                          = dic["id"]                         as? Int ?? 0
        socialLinks                 = createSocialLinks(dic: dic["social_links"] as? [String : AnyObject] ?? [:])
    }
    
    internal func createSocialLinks(dic: [String:AnyObject])->SocialLinks {
        return SocialLinks(dic: dic)
    }
    
}
