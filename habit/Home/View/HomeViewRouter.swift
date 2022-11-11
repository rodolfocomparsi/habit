//
//  HomeViewRouter.swift
//  habit
//
//  Created by Rodolfo Comparsi on 17/08/22.
//

import Foundation
import SwiftUI

enum HomeViewRouter {
    static func makeHabitView() -> some View {
        let viewModel = HabitViewModel()
        return HabitView(viewModel: viewModel)
    }
}
