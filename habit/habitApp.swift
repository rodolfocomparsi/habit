//
//  habitApp.swift
//  habit
//
//  Created by Rodolfo Comparsi on 12/07/22.
//
import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel(interactor: SplashInteractor()))
        }
    }
}
