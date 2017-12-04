//
//  QuestionExhibition.swift
//  yotpoKit
//
//  Created by Liliane Lima on 10/05/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
//

import Foundation

public struct QuestionExhibition {
    public var displayImage: String = ""
    public var name: String = ""
    public var date: String = ""
    public var contentText: String = ""
    
    public var amountAnswer: Int = 0
    public var votesUp: Int = 0
    public var votedDown: Int = 0
    public var idQuestion: Int = 0
    public var idAnswer: Int = 0
    
    public var typeQuestion: TypeQuestion
    
    public var isOpen: Bool = false
    public var isHiddenText: Bool = false
    
    public init(withQuestion question: Question) {
        idQuestion = question.id
        idAnswer = 0
        displayImage = question.asker.socialImage
        name = question.asker.displayName
        date = question.createdAt
        contentText = question.content
        amountAnswer = question.answers.count
        votesUp = 0
        votedDown = 0
        typeQuestion = .question
        isOpen = false
        isHiddenText = false
    }
    
    public init(withAnswer answer: Answer, idQuest: Int) {
        idQuestion = idQuest
        idAnswer = answer.id
        displayImage = answer.answerer.socialImage
        name = answer.answerer.displayName
        date = answer.createdAt
        contentText = answer.content
        amountAnswer = 0
        votesUp = answer.votesUp
        votedDown = answer.votedDown
        typeQuestion = .answer
        isOpen = false
        isHiddenText = false
    }
}

public enum TypeQuestion {
    case question
    case answer
}
