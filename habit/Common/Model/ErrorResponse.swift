//
//  ErrorResponse.swift
//  habit
//
//  Created by Rodolfo Comparsi on 02/08/22.
//

import Foundation

struct ErrorResponse: Decodable {
    
    let detail: String
   
    
    enum codingKeys: String, CodingKey {
        case detail
       
    }
}
