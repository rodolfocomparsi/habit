//
//  File.swift
//  Habit
//
//  Created by Rodolfo Comparsi on 12/07/22.
//

import Foundation

enum SignInUIState: Equatable {
  case none
  case loading
  case goToHomeScreen
  case error(String)
}
