//
//  Pagination.swift
//  yotpoKit
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
//

import Foundation

public struct Pagination {
    public var page     : Int = 0
    public var perPage  : Int = 0
    public var total    : Int = 0
    
    public init(){}
    
    public init(dic:[String:AnyObject]) {
        page        = dic["page"]       as? Int ?? 0
        perPage     = dic["per_page"]   as? Int ?? 0
        total       = dic["total"]      as? Int ?? 0
        
    }
    
}
