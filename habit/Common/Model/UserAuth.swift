//
//  UserAuth.swift
//  habit
//
//  Created by Rodolfo Comparsi on 08/08/22.
//

import Foundation

struct UserAuth: Codable {
    var idToken: String
    var refreshToken: String
    var expires: Double = 0.0
    var tokenType: String
    
    enum codingKeys: String, CodingKey {
        case idtoken = "access_token"
        case refreshToken = "refres_token"
        case expires
        case tokenType = "token_type"
    }
}
