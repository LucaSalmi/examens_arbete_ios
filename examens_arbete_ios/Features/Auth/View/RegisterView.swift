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
    VStack {
      Form {
        Section {
          TextField("Name", text: $viewModel.userName)
          TextField("Email", text: $viewModel.userEmail)
                        .keyboardType(.emailAddress)
          SecureField("Password", text: $viewModel.userPassword)
          SecureField("Repete the Password", text: $viewModel.userRepeatedPassword)
        }
        
        Button("Sign Up") {
          print("Button tapped")
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .foregroundColor(.white)
        .opacity(buttonOpacity)
        .disabled(!viewModel.formIsValid)
      }
    }
  }
  
  var buttonOpacity: Double {
    return viewModel.formIsValid ? 1 : 0.5
  }
}
