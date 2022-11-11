//
//  HabitUIState.swift
//  habit
//
//  Created by Rodolfo Comparsi on 17/08/22.
//

import Foundation


enum HabitUIState: Equatable {
    case loading
    case emptyList
    case fullList([HabitCardViewModel])
    case error(String)
}

