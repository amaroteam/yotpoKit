//
//  RequestYotpo.swift
//  yotpoKit
//
//  Created by Liliane Lima on 18/04/17.
//  Copyright © 2017 Liliane Lima . All rights reserved.
//

import Foundation

open class RequestYotpo {
    
    public struct Filters {
        let sort: String?
        let direction: String?
        
        public init(sort: String, direction: String) {
            self.sort = sort
            self.direction = direction
        }
    }
    
    //Generic typealias for completions
    public typealias CompletionWithServerResponse = (_ code: Int, _ msg: String) -> Void
    open var appKey: String = ""
    open var clientSecret: String = ""
    open var tokenId: String = ""
    
    init(appK: String, clientS: String, token: String = "") {
        appKey = appK
        clientSecret = clientS
        tokenId = token
    }
}

extension RequestYotpo {
    struct GetMessage {
        static let InternetError   = (code: 2, msg: "Não foi possível se conectar.")
        static let ParsingError    = (code: 3, msg: "Não foi possível carregar as informações.")
        static let Success         = (code: 0, msg: "Success")
        static let SuccessQuestion = (code: 0, title: "OBRIGADO POR POSTAR SUA PERGUNTA!", 
                                      msg:"Por favor acesse o link do e-mail de confirmação. \nA sua pergunta aparecerá no site após alguém responde-la.")
    }
}

enum FittingTag: String {
    case clothes = "--11983"
    case shoes = "--12075"
}

enum FittingClothesToolTip: String {
    case veryTight = "Mais Justa"
    case perfect = "Perfeita"
    case veryLoose = "Mais Solta"
}

enum FittingShoesToolTip: String {
    case veryTight = "Mais Justo"
    case perfect = "Perfeito"
    case veryLoose = "Mais Folgado"
}
