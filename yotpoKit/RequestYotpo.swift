//
//  RequestYotpo.swift
//  yotpoKit
//
//  Created by Liliane Lima on 18/04/17.
//  Copyright © 2017 Liliane Lima . All rights reserved.
//

import Foundation
open class RequestYotpo {
    
    //Generic typealias for completions
    public typealias completionWithServerResponse = (_ code: Int, _ msg: String)->Void
    open var appKey: String = ""
    open var clientSecret:String = ""
    open var tokenId:String = ""
    
    init(appK: String, clientS: String, token: String = "") {
        appKey = appK
        clientSecret = clientS
        tokenId = token
    }
}

extension RequestYotpo {
    struct getMessage {
        static let InternetError   = (code: 2, msg: "Não foi possível se conectar.")
        static let ParsingError    = (code: 3, msg: "Não foi possível carregar as informações.")
        static let Success         = (code: 0, msg: "Success")
        static let SuccessQuestion = (code: 0, title: "OBRIGADO POR POSTAR SUA PERGUNTA!", msg:"Por favor, clique no link no e-mail de confirmação que acabamos de enviar para enviar a sua pergunta para o dono da loja. \nA sua pergunta aparecerá no site após alguém responde-la.")
    }
}
