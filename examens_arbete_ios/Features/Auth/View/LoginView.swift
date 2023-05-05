//
//  LoginView.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @ObservedObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
    }
    
    var buttonOpacity: Double {
        return viewModel.loginFormIsValid ? 1 : 0.5
    }
    
    var body: some View {
        ZStack{
            NavigationView {
                VStack{
                    Form{
                        Section {
                            TextField("E-Mail", text: $viewModel.userEmail)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                            SecureInputField("Password", text: $viewModel.userPassword)
                                .textInputAutocapitalization(.never)
                        }
                        NavigationLink("Register") {
                            RegisterView()
                        }.padding()
                        Button("Login"){
                            viewModel.isLoading = true
                            viewModel.loginUser()
                            
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
            
            if(viewModel.isLoading){
                ModalView(showLoading: $viewModel.isLoading)
            }
        }
    }
}

