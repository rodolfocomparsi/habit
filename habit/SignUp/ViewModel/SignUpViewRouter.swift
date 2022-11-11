//
//  SignUpViewRouter.swift
//  Habit
//
//  Created by Rodolfo Comparsi on 12/07/22.
//

import SwiftUI

enum SignUpViewRouter {
  
  static func makeHomeView() -> some View {
    let viewModel = HomeViewModel()
    return HomeView(viewModel: viewModel)
  }
  
}
