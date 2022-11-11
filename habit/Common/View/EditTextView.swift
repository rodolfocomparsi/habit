//
//  EditTextView.swift
//  habit
//
//  Created by Rodolfo Comparsi on 12/07/22.
//

import SwiftUI

struct EditTextView: View {
    @Binding var text: String
    
    var placeholder: String = ""
    var keyboard: UIKeyboardType = .default
    var error: String? = nil
    var failure: Bool? = nil
    var isSecure: Bool = false
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            } else{
                TextField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            }
            
                    if let error = error, failure == true, !text.isEmpty {
                    Text(error).foregroundColor(.red)
                    }
                }
        .padding(.bottom, 10)
            }
        }
        

struct EditTextView_previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {
                EditTextView(text: .constant(""),
                placeholder: "E-mail",
                error: "campo invalido",
                failure: "a@a.com".count < 3)
                .padding()
            }
            .frame(maxWidth: .infinity,
             maxHeight: .infinity)
            .previewDevice("Iphone 11")
            .preferredColorScheme($0)
        }
    }
}
