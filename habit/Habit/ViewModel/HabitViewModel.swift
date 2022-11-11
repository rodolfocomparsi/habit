//
//  HabitViewModel.swift
//  habit
//
//  Created by Rodolfo Comparsi on 17/08/22.
//

import Foundation
import Combine
import SwiftUI

class HabitViewModel: ObservableObject {
    @Published var uiState: HabitUIState = .loading
    
    @Published var title = "Atenção"
    @Published var headline = "Fique ligado!"
    @Published var desc = "Você está estrasado nos hábitos"
    
    private var cancellableRequest: AnyCancellable?
    private let interactor: HabitInteractor
    
    init(interactor: HabitInteractor) {
        self.interactor = interactor
    }
    deinit {
        cancellableRequest?.cancel()
    }
    
    
    func onAppear() {
        self.uiState = .loading
        
        cancellableRequest = interactor.fetchHabits()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch(completion) {
                  case .failure(let appError):
                    self.uiState = .error(appError.message)
                    break
                  case .finished:
                    break
                }
                
            }, receiveValue: { response in
                if response.isEmpty {
                    self.uiState = .emptyList
                    
                    self.title = ""
                    self.headline = "Fique ligado"
                    self.desc = "Voce ainda nao possui Hábitos"
                } else {
                    self.uiState = .fullList(
                        response.map {_ in
                            
                            let lastDate = $0.lastDate?.toDate(sourcePattern: "yyy-MM-dd'T'HH:mm:ss",
                                                               destPattern: "dd/MM/yyyy HH:mm") ?? ""


                            var state = Color.green
                            self.title = "Muito bom!"
                            self.headline = "seus hábitos estão em dia"
                            self.desc = ""

                            if $0.lastDate?.toDate(sourcerPattern: "yyy-MM-dd'T'HH:mm:ss",
                                                   destPattern: "dd/MM/yyyy HH:mm")

                            return HabitCardViewModel(id: $0.id,
                                                       icon: $0.iconUrl ?? "",
                                                       date: lastDate,
                                                       name: $0.name,
                                                       label: $0.label,
                                                       value: "\($0.value ?? 0)",
                                                       state: state)

                        }
                    )
                }
            })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

            var rows: [HabitCardViewModel] = []

            rows.append(HabitCardViewModel(id: 1,
                                           icon: "https://via.placeholder.com/150",
                                           date: "01/01/2021 00:00:00",
                                           name: "Tocar guitarra",
                                           label: "horas",
                                           value: "2",
                                           state: .green))

            rows.append(HabitCardViewModel(id: 2,
                                           icon: "https://via.placeholder.com/150",
                                           date: "01/01/2021 00:00:00",
                                           name: "fazer caminhada",
                                           label: "km",
                                           value: "5",
                                           state: .green))

            rows.append(HabitCardViewModel(id: 3,
                                           icon: "https://via.placeholder.com/150",
                                          date: "01/01/2021 00:00:00",
                                          name: "Treino",
                                           label: "horas",
                                          value: "1",
                                          state: .green))

         rows.append(HabitCardViewModel(id: 4,
                                          icon: "https://via.placeholder.com/150",
                                          date: "01/01/2021 00:00:00",
                                           name: "Estudar",
                                           label: "horas",
                                           value: "4",
                                           state: .green))

            rows.append(HabitCardViewModel(id: 5,
                                          icon: "https://via.placeholder.com/150",
                                          date: "01/01/2021 00:00:00",
                                          name: "Lazer",
                                           label: "horas",
                                          value: "2",
                                          state: .green))

            self.uiState = .fullList(rows)
        }
    }
}
