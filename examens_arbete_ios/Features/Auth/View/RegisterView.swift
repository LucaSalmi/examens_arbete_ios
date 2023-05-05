//
//  RegisterView.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import SwiftUI
import Combine

struct RegisterView: View {
    
    @ObservedObject private var viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel = SignUpViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack{
            VStack {
                Form {
                    Section {
                        TextField("Name", text: $viewModel.userName)
                        MailInputField("Email", text: $viewModel.userEmail)
                        SecureInputField("Password", text: $viewModel.userPassword)
                        SecureInputField("Repeat the Password", text: $viewModel.userRepeatedPassword)
                    }
                    
                    Button("Sign Up") {
                        viewModel.signUpUser()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .opacity(buttonOpacity)
                    .disabled(!viewModel.formIsValid)
                    .alert(Text(viewModel.result.error?.localizedDescription ?? "Error"), isPresented: $viewModel.hasError) {
                        Button("Ok", role: .cancel){
                            viewModel.hasError = false
                        }
                    }
                }
            }
            
            if(viewModel.isLoading){
                LoadingView(showLoading: $viewModel.isLoading)
            }
        }
    }
    
    var buttonOpacity: Double {
        return viewModel.formIsValid ? 1 : 0.5
    }
}
