//
//  HabitCardView.swift
//  habit
//
//  Created by Rodolfo Comparsi on 19/08/22.
//

import SwiftUI

struct HabitCardView: View {
  
  @State private var action = false
  
  let viewModel: HabitCardViewModel
  
  var body: some View {
    ZStack(alignment: .trailing) {
      
      NavigationLink(
        destination: Text("Destination"),
        isActive: self.$action,
        label: {
          EmptyView()
        }
      )
      
      Button(action: {
        self.action = true
      }, label: {
        
        HStack {
          
          Image(systemName: "pencil")
            .padding(.horizontal, 8)
          
          Spacer()
          
          HStack(alignment: .top) {
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
              
              Text(viewModel.name)
                .foregroundColor(Color.orange)
                            
              Text(viewModel.label)
                .foregroundColor(Color("textColor"))
                .bold()
              
              Text(viewModel.date)
                .foregroundColor(Color("textColor"))
                .bold()
              
            }.frame(maxWidth: 300, alignment: .leading)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
              
              Text("Registrado")
                .foregroundColor(Color.orange)
                .bold()
                .multilineTextAlignment(.leading)
              
              Text(viewModel.value)
                .foregroundColor(Color("textColor"))
                .bold()
                .multilineTextAlignment(.leading)
              
            }
            
            Spacer()
            
          }
          
          Spacer()
        }
        .padding()
        .cornerRadius(4.0)
        
      })
      
      Rectangle()
        .frame(width: 8)
        .foregroundColor(viewModel.state)
      
    }.background(
      RoundedRectangle(cornerRadius: 4.0)
        .stroke(Color.orange, lineWidth: 1.4)
        .shadow(color: .gray, radius: 2, x: 2.0, y: 2.0)
    )
    .padding(.horizontal, 4)
    .padding(.vertical, 8)
    
  }
}

struct HabitCardView_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) {
      NavigationView {
        
        List {
          HabitCardView(viewModel: HabitCardViewModel(id: 1,
                                                      icon: "https://via.placeholder.com/150",
                                                      date: "01/01/2021 00:00:00",
                                                      name: "Tocar guitarra",
                                                      label: "horas",
                                                      value: "2",
                                                      state: .green))
          
          HabitCardView(viewModel: HabitCardViewModel(id: 1,
                                                      icon: "https://via.placeholder.com/150",
                                                      date: "01/01/2021 00:00:00",
                                                      name: "Tocar guitarra",
                                                      label: "horas",
                                                      value: "2",
                                                      state: .green))
        }.frame(maxWidth: .infinity)
        .navigationTitle("Teste")
        
      }
      
      .previewDevice("iPhone 11")
        .preferredColorScheme($0)
    }
  }
}
