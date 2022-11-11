//
//  SignInVIew.swift
//  habit
//
//  Created by Rodolfo Comparsi on 12/07/22.
//


import SwiftUI

struct SignInView: View {
  
  @ObservedObject var viewModel: SignInViewModel

  @State var action: Int? = 0
  
  @State var navigationHidden = true
  
  var body: some View {
    ZStack {
      if case SignInUIState.goToHomeScreen = viewModel.uiState {
        viewModel.homeView()
      } else {
        NavigationView {
          
          ScrollView(showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 20) {
              
              Spacer(minLength: 36)
              
              VStack(alignment: .center, spacing: 8) {
                Image("logo")
                  .resizable()
                  .scaledToFit()
                  .padding(.horizontal, 48)
                
                Text("Login")
                  .foregroundColor(.orange)
                  .font(Font.system(.title).bold())
                  .padding(.bottom, 8)
                
                emailField
                
                passwordField
                
                enterButton
                
                registerLink
                
                Text("Copyright - RODCOMP")
                  .foregroundColor(Color.gray)
                  .font(Font.system(size: 13).bold())
                  .padding(.top, 16)
              }
              
            }
            
            if case SignInUIState.error(let value) = viewModel.uiState {
              Text("")
                .alert(isPresented: .constant(true)) {
                  Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")) {
                    // faz algo quando some o alerta
                  })
                }
            }
          }
          .frame(maxWidth:.infinity, maxHeight: .infinity)
          .padding(.horizontal, 32)
          .navigationBarTitle("Login", displayMode: .inline)
          .navigationBarHidden(navigationHidden)
        }
        .onAppear {
          self.navigationHidden = true
        }
        .onDisappear {
          self.navigationHidden = false
        }
      }
    }
  }
  
}

extension SignInView {
  var emailField: some View {
    EditTextView(text: $viewModel.email,
                 placeholder: "E-mail",
                 keyboard: .emailAddress,
                 error: "e-mail inválido",
                 failure: !viewModel.email.isEmail())
  }
}

extension SignInView {
  var passwordField: some View {
    EditTextView(text: $viewModel.password,
                 placeholder: "Senha",
                 keyboard: .emailAddress,
                 error: "senha deve ter ao menos 8 caracteres",
                 failure: viewModel.password.count < 8,
                 isSecure: true)
  }
}

extension SignInView {
  var enterButton: some View {
    LoadingButtonView(action: {
      viewModel.login()
    },
    text: "Entrar",
                      disabled: !viewModel.email.isEmail() || viewModel.password.count < 8, showProgress: self.viewModel.uiState == SignInUIState.loading)
  }
}

extension SignInView {
  var registerLink: some View {
    VStack {
      Text("Ainda não possui um login ativo?")
        .foregroundColor(.gray)
        .padding(.top, 48)
      
      ZStack {
        NavigationLink(
          destination: viewModel.signUpView(),
          tag: 1,
          selection: $action,
          label: { EmptyView() })
        
        Button("Realize seu Cadastro") {
          self.action = 1
        }
      }
      
    }
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) {
      let viewModel = SignInViewModel(interactor: SignInInteractor())
      SignInView(viewModel: viewModel)
        .previewDevice("iPhone 11")
        .preferredColorScheme($0)
    }
  }
}
