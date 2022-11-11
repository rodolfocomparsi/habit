//
//  2.swift
//  Habit
//
//  Created by Rodolfo Comparsi on 12/07/22.
//

import SwiftUI

enum SplashViewRouter {
  
  static func makeSignInView() -> some View {
    let viewModel = SignInViewModel(interactor: SignInInteractor())
    return SignInView(viewModel: viewModel)
  }
  
    static func makeHomeView() -> some View {
        let viewModel =  HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
    
}
