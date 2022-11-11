//
//  HabitInteractor.swift
//  habit
//
//  Created by Rodolfo Comparsi on 23/08/22.
//

import Foundation
import Combine

class HabitInteractor{
    
    private let remote: HabitRemoteDataSource = .shared
   
    
}
extension HabitInteractor {
    
    func fetchHabits() -> Future<[HabitResponse], AppError> {
        return remote.fetchHabits()
    }
 
    
}
