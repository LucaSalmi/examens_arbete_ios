//
//  LoginView.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @ObservedObject private var navigatorState: StateController
    @ObservedObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel = LoginViewModel(), navigatorState : StateController) {
        self.viewModel = viewModel
        self.navigatorState = navigatorState
    }
    
    var buttonOpacity: Double {
        return viewModel.loginFormIsValid ? 1 : 0.5
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Section {
                        TextField("E-Mail", text: $viewModel.userEmail)
                            .keyboardType(.emailAddress)
                        SecureInputField("Password", text: $viewModel.userPassword)
                    }
                    NavigationLink("Register") {
                        RegisterView()
                    }.padding()
                    Button("Login"){
                        navigatorState.goToHomepage()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .opacity(buttonOpacity)
                    .disabled(!viewModel.loginFormIsValid)
                }
            }
        }
        
        
    }
}

