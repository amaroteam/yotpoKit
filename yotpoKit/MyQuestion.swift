//
//  MyQuestion.swift
//  yotpoKit
//
//  Created by Liliane Lima on 17/04/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
//

import Foundation
import Alamofire

open class MyQuestion: RequestYotpo {
    
    //Aliases to custom closures
    public typealias completionWithProductQuestions         = (_ code: Int, _ msg: String, _ productQuestion: ProductQuestion?)->Void
    public typealias completionWithQuestions                = (_ code: Int, _ msg: String, _ questions: [Question])->Void
    public typealias completionWithQuestionsAndExhibition   = (_ code: Int, _ msg: String, _ productQuestion: ProductQuestion, _ questionsExhibition:[QuestionExhibition])->Void
    public typealias completionDefault                      = (_ code: Int, _ msg: String)->Void
    public typealias completionQuestion                     = (_ code: Int, _ title: String, _ msg:String)->Void
    
    open func getQuestions(productId:String, completion: @escaping completionWithProductQuestions) {
        let endPoint = Endpoint.MyQuestion().getQuestions(productId: productId, appKey: appKey)
    
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg,nil)
                        return
                }
                
                if code == 200 {
                    guard let questionDict = JSON["response"] as? [String: AnyObject] else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg,nil)
                        return
                    }
                    
                    let productQ = ProductQuestion(dic: questionDict)
                    completion(code, message, productQ)
 
                } else {
                    completion(code, message, nil)
                }
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg, nil)
            }
        }
    }
    
    open func getQuestionPerPage(productId:String, page:Int, completion: @escaping completionWithQuestions) {
        let endPoint = Endpoint.MyQuestion().getQuestionPage(productId: productId, appKey: appKey, token: tokenId, page: page)
        
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg,[])
                        return
                }
                
                if code == 200 {
                    guard let questionDict = JSON["response"] as? [String: AnyObject] else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg,[])
                        return
                    }
                    
                    let productQ = ProductQuestion(dic: questionDict)
                    completion(code, message, productQ.questions)
                    
                } else {
                    completion(code, message, [])
                }
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg, [])
            }
        }
        
    }
    
    open func getQuestionResume(productId:String, completion: @escaping completionWithProductQuestions) {
        let endPoint = Endpoint.MyQuestion().getQuestionResume(productId: productId, appKey: appKey)
        
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg,nil)
                        return
                }
                
                if code == 200 {
                    guard let questionDict = JSON["response"] as? [String: AnyObject] else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg,nil)
                        return
                    }
                    
                    let productQ = ProductQuestion(resumeDic: questionDict)
                    completion(code, message, productQ)

                } else {
                    completion(code, message, nil)
                }
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg, nil)
            }
        }
    }
    
    open func saveVoteQuestion(questionId:String, voteType:VoteType, completion: @escaping completionDefault) {
        let endPoint = Endpoint.MyQuestion().saveVoteQuestion(questionId: questionId, vote: voteType)
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String,
                    let _ = JSON["response"] as? [String: AnyObject] else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg)
                        return
                }
                completion(code, message)
                
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg)
            }
        }
    }
    
    open func removeVoteQuestion(questionId:String,voteType:VoteType, completion: @escaping completionDefault) {
        let endPoint = Endpoint.MyQuestion().removeVoteQuestion(questionId: questionId, vote: voteType)
        
        Alamofire.request(endPoint.URI, method: endPoint.method).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let message = JSON["status"]?["message"] as? String,
                    let _ = JSON["response"] as? [String: AnyObject] else {
                        completion(getMessage.ParsingError.code, getMessage.ParsingError.msg)
                        return
                }
                completion(code, message)
            case .failure:
                completion(getMessage.InternetError.code, getMessage.InternetError.msg)
            }
        }
    }
    
    open func saveQuestion(post:Post, completion: @escaping completionQuestion) {
        let parameter = post.convertToParameterQuestion(appKey: appKey)
        Alamofire.request(Endpoint.MyQuestion.saveQuestion.URI, method: Endpoint.MyQuestion.saveQuestion.method, parameters: parameter).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let JSON = response.result.value as? [String: AnyObject],
                    let code = JSON["status"]?["code"] as? Int,
                    let _ = JSON["status"]?["message"] as? String,
                    code == 200  else {
                        completion(getMessage.ParsingError.code, "Error" ,getMessage.ParsingError.msg)
                        return
                }
                completion(code, getMessage.SuccessQuestion.title, getMessage.SuccessQuestion.msg)
                
            case .failure:
                completion(getMessage.InternetError.code, "Error", getMessage.InternetError.msg)
            }
            
        }
    }
    
    open func getNextQuestions(productQuestion:ProductQuestion, oldQuestionsExhibition:[QuestionExhibition], productId:String, completion: @escaping completionWithQuestionsAndExhibition) {
        let myOldProductQuestion = productQuestion.questions.filter { (question) -> Bool in
            return question.id != 0
        }
        var newProductQuestion = productQuestion
        
        if productQuestion.totalQuestions > myOldProductQuestion.count {
            let currentPage = myOldProductQuestion.count/5
            var questionsExhibition = [QuestionExhibition]()
            getQuestionPerPage(productId: productId, page: currentPage+1, completion: { (code, msg, result) in
                newProductQuestion.questions += result
                
                for question in result {
                    let questExhibition = QuestionExhibition(withQuestion: question)
                    
                    let isContain = oldQuestionsExhibition.contains(where: { (questionEx) -> Bool in
                        return questionEx.idQuestion == questExhibition.idQuestion && questionEx.idAnswer == questExhibition.idAnswer && questionEx.typeQuestion == questExhibition.typeQuestion
                    })
                    if !isContain {
                        questionsExhibition.append(questExhibition)
                        for answer in question.answers {
                            let answerExhibition = QuestionExhibition(withAnswer: answer, idQuest: question.id)
                            questionsExhibition.append(answerExhibition)
                        }
                    }
                    
                    
                }
                
                completion(code, msg, newProductQuestion,questionsExhibition)
            })
        } else {
            completion(2, "There aren't questions to download", newProductQuestion, [])
        }
    }
    
    
    open func convertProductQuestionToUnicArray(productQuestion:ProductQuestion)->[QuestionExhibition] {
        var questionsExhibition = [QuestionExhibition]()
        let questions = productQuestion.questions
        
        
        for question in questions {
            let questExhibition = QuestionExhibition(withQuestion: question)
            questionsExhibition.append(questExhibition)
            for answer in question.answers {
                let answerExhibition = QuestionExhibition(withAnswer: answer, idQuest: question.id)
                questionsExhibition.append(answerExhibition)
            }
        }
        
        return questionsExhibition
    }

}
