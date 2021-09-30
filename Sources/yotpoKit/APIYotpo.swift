//
//  APIYotpo.swift
//  yotpoKit
//
//  Created by Liliane Lima on 18/04/17.
//  Copyright © 2017 Liliane Lima . All rights reserved.
//

import Foundation

///The API base that is reponsable to instatianciate the all the others request.
open class APIYotpo {
    
    fileprivate let appKey: String
    fileprivate let clientSecret: String
    
    public init(appK: String, clientS: String) {
        appKey = appK
        clientSecret = clientS
    }
    
    fileprivate var _yotpo: Yotpo?
    open var yotpo: Yotpo {
        if _yotpo == nil {
            _yotpo = Yotpo(appK: appKey, clientS: clientSecret)
        }
        return _yotpo!
    }
}
