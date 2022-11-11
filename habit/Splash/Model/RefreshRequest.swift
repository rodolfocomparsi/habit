//
//  RefreshRequest.swift
//  habit
//
//  Created by Rodolfo Comparsi on 11/08/22.
//

import Foundation

struct RefreshRequest: Encodable {

    let token: String
    
    enum codingKeys: String, CodingKey {
        case token = "refresh_token"
        
        
    }
}
