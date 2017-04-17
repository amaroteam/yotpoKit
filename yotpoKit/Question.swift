//
//  Question.swift
//  yotpoKit
//
//  Created by Liliane Lima on 17/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation

public struct Question {
    
    public var id           : Int       = 0
    public var content      : String    = ""
    public var userType     : String    = ""
    public var createdAt    : String    = ""
    public var asker        : Asker     = Asker()
    public var answers      : [Answer]  = []
    
    public init(dic:[String:AnyObject]) {
        id          = dic["id"]             as? Int     ?? 0
        content     = dic["content"]        as? String  ?? ""
        userType    = dic["user_type"]      as? String  ?? ""
        createdAt   = dic["created_at"]     as? String  ?? ""
        asker       = createAsker(dic: dic["asker"] as? [String : AnyObject] ?? [:])
        answers     = createAnswers(fromArray: dic["sorted_public_answers"] as? [[String : AnyObject]] ?? [])
    }
    
    internal func createAsker(dic: [String:AnyObject])->Asker {
        return Asker(dic: dic)
    }
    
    internal func createAnswers(fromArray array: [[String:AnyObject]])->[Answer] {
        var myAnswer:[Answer] = []
        myAnswer = array.map({ (answerDict) in
            return Answer(dic: answerDict)
        })
        
        return myAnswer
    }
}
