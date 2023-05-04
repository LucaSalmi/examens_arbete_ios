//
//  LoginView.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var state: StateController
    
    let userManager = UserManager.userManager
    
    @State var eMail: String = ""
    @State var password: String = ""
    @State private var showRegisterAccount = false
    @State var saveLogin = false
    @State var isLoading = false
    @State var isConnected = false
    
    var body: some View {
        VStack{
            Text("Login")
            
            TextField("E-mail", text: $eMail)
                .padding()
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            SecureInputField("Password", text: $password)
                .padding()
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            Button("Login") {
                print("mail: " + eMail)
                print("password: " + password)
            }
        }
    }
}

