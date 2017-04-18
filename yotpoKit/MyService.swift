//
//  MyService.swift
//  yotpoKit
//
//  Created by Liliane Lima on 17/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation
import Alamofire

open class MyService: RequestYotpo {
    
    //Aliases to custom closures
    public typealias completionWithToken = (_ code: Int, _ msg: String, _ token: String?)->Void
    
    
    open func requestToken(_ completion: @escaping completionWithToken) {
        let parameter = [
            "client_id"     :appKey,
            "client_secret" : clientSecret,
            "grant_type"    : "client_credentials"
        ]
        
        Alamofire.request(Endpoint.MyService.authentication.URI, method: Endpoint.MyService.authentication.method, parameters: parameter).responseJSON { (response) in
            switch response.result {
            case .success:
                
                guard let JSON = response.result.value as? [String: AnyObject] else {
                    completion(getMessage.ParsingError.code, getMessage.ParsingError.msg, nil)
                    return
                }
                
                if let token = JSON["access_token"] as? String {
                    completion(getMessage.Success.code, getMessage.Success.msg, token)
                } else if let code = JSON["status"]?["code"] as? Int, let message = JSON["status"]?["message"] as? String {
                    completion(code, message, nil)
                } else {
                    completion(getMessage.ParsingError.code, getMessage.ParsingError.msg, nil)
                }
                
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg, nil)
            }
        }
    }
    
    
}
