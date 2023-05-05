//
//  SecureInputField.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import SwiftUI

struct SecureInputField: View {
    
    @Binding private var password: String
    @State private var isSecured: Bool = true
    
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        
        self.title = title
        self._password = text
        
    }
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    
                } else {
                    TextField(title, text: $password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    
                }
                
            }.padding(.trailing, 32)
            Button(action: {
                isSecured.toggle()
                
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
                
            }
            
        }
        
    }
}
