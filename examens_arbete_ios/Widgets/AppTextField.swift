//
//  AppTextField.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-05.
//

import SwiftUI

struct AppTextField: View {
    
    var text: Binding<String>
    var label: String
    var inputType: UIKeyboardType
    
    var body: some View {
        TextField(label, text: text)
            .keyboardType(inputType)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }
}
