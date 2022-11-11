//
//  LoadingButtonView.swift
//  habit
//
//  Created by Rodolfo Comparsi on 13/07/22.
//

import SwiftUI

struct LoadingButtonView: View {
    
    var action: () -> Void
    var text: String
    var disabled: Bool = false
    var showProgress: Bool = false
    
    var body: some View {
        ZStack{
            Button(action: {
                action()
            }, label: {
                Text(showProgress ? "" : text)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .font(Font.system(.title3).bold())
                    .background(disabled ? Color("lightOrange") : Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(4.0)
            }).disabled(disabled || showProgress)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
            
        }
    }
}

struct LoadingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {
                LoadingButtonView(action: {
                    print("Ola mundo")
                },
                                  text: "Entrar",
                                  disabled: false,
                                  showProgress: false)
            }.padding()
            .frame(maxWidth: .infinity,
             maxHeight: .infinity)
            .previewDevice("Iphone 11")
            .preferredColorScheme($0)
        }
    }
}
