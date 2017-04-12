//
//  Request.swift
//  yotpoKit
//
//  Created by Liliane Lima on 11/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation

open class Request {
    
    //Generic typealias for completions
    public typealias completionWithServerResponse = (_ code: Int, _ msg: String)->Void
    open var appKey = "0eU0TYNuFzWbeD60wD2lB7UWnCbAkVtX3vwtaEH0"
    
    init() {}
}

extension Request {
    struct getMessage {
        static let InternetError = (code: 2, msg: "Não foi possível se conectar.")
        static let ParsingError  = (code: 3, msg: "Não foi possível carregar as informações.")
        static let Success       = (code: 0, msg: "Success")
    }
}
