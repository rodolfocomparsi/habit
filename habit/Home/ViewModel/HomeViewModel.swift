//
//  File.swift
//  Habit
//
//  Created by Rodolfo Comparsi on 12/07/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
  
}


extension HomeViewModel {
    func habitView() -> some View {
        return HomeViewRouter.makeHabitView()
    }
}
