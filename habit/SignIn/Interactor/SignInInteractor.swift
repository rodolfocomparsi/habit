//
//  SingInInteractor.swift
//  habit
//
//  Created by Rodolfo Comparsi on 04/08/22.
//

import Foundation
import Combine

class SignInInteractor{
    
    private let remote: SignInRemoteDataSource = .shared
    private let local: LocalDataSource = .shared
    
}
extension SignInInteractor {
    
    func login(loginRequest request: SignInRequest) -> Future<SignInResponse, AppError> {
        return remote.login(request: request)
    }
 
    func insertAuth(userAuth: UserAuth) {
        local.insertUserAuth(userAuth: userAuth)
    }
    
}
