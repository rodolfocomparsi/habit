//
//  SignUpRequest.swift
//  habit
//
//  Created by Rodolfo Comparsi on 20/07/22.
//

import Foundation


struct SignUpRequest: Encodable {

    let fullName: String
    let email: String
    let password: String
    let document: String
    let phone: String
    let birthday: String
    let gender: Int
    
    enum codingKeys: String, CodingKey {
        case fullName = "name"
        case email
        case password
        case document
        case phone
        case birdthday
        case gender
        
    }
}
