//
//  ProductQuestion.swift
//  yotpoKit
//
//  Created by Liliane Lima on 17/04/17.
//  Copyright © 2017 Liliane Lima . All rights reserved.
//

import Foundation

public struct ProductQuestion {

    public var totalQuestions: Int   = 0
    public var totalAnswers: Int     = 0
    public var questions: [Question] = []
    
    public init() {}
    
    public init(dic: [String: AnyObject]) {
        totalQuestions = dic["total_questions"]    as? Int ?? 0
        totalAnswers = dic["total_answers"]      as? Int ?? 0
        questions = createQuestion(fromArray: dic["questions"] as? [[String: AnyObject]] ?? [])
    }
    
    public init(resumeDic: [String: AnyObject]) {
        totalQuestions = resumeDic["total_questions"]    as? Int ?? 0
        totalAnswers = resumeDic["total_answers"]      as? Int ?? 0
    }

    internal func createQuestion(fromArray array: [[String: AnyObject]]) -> [Question] {
        var myQuestions: [Question] = []
        myQuestions = array.map({ (questionDict) in
            return Question(dic: questionDict)
        })
        
        return myQuestions
    }
}

public extension Sequence where Iterator.Element == Question {
    func convertQuestionToQuestionFormatter() -> [QuestionExhibition] {
        var myQuestionFormatter: [QuestionExhibition] = []
        
        for selectQuestion in self {
            let questExhibition = QuestionExhibition(withQuestion: selectQuestion)
            myQuestionFormatter.append(questExhibition)
            
            for answer in selectQuestion.answers {
                let answerExhibition = QuestionExhibition(withAnswer: answer, idQuest: selectQuestion.id)
                myQuestionFormatter.append(answerExhibition)
            }
        }
        return myQuestionFormatter
    }
}
