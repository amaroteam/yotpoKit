//
//  Answer.swift
//  yotpoKit
//
//  Created by Liliane Lima on 17/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation

public struct Answer {
    public var content              : String    = ""
    public var createdAt            : String    = ""
    public var id                   : Int       = 0
    public var votesUp              : Int       = 0
    public var votedDown            : Int       = 0
    public var storeOwnerComment    : Bool      = false
    public var answerer            : Asker     = Asker()
    
    public init() {}
    
    public init(dic:[String:AnyObject]) {
        content             = dic["content"]                as? String  ?? ""
        createdAt           = dic["created_at"]             as? String  ?? ""
        id                  = dic["id"]                     as? Int     ?? 0
        votesUp             = dic["votes_up"]               as? Int     ?? 0
        votedDown           = dic["votes_down"]             as? Int     ?? 0
        storeOwnerComment   = dic["store_owner_comment"]    as? Bool    ?? false
        answerer            = createAnswerer(dic: dic["answerer"] as? [String : AnyObject] ?? [:])
    }
    
    internal func createAnswerer(dic: [String:AnyObject])->Asker {
        return Asker(dic: dic)
    }
}
