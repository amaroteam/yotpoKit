//
//  StarDistribution.swift
//  yotpoKit
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
//

import Foundation

public struct StarDistribution {
    // swiftlint:disable identifier_name
    public var s1: Int = 0
    public var s2: Int = 0
    public var s3: Int = 0
    public var s4: Int = 0
    public var s5: Int = 0
    
    public init() {}
    
    public init(dic: [String: AnyObject]) {
        s1 = dic["1"]  as? Int ?? 0
        s2 = dic["2"]  as? Int ?? 0
        s3 = dic["3"]  as? Int ?? 0
        s4 = dic["4"]  as? Int ?? 0
        s5 = dic["5"]  as? Int ?? 0
        
    }
}
