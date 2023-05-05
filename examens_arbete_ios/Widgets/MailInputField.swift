//
//  MailInputField.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-05.
//

import SwiftUI

struct MailInputField: View {
    @Binding private var mail: String
    private var title: String

    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._mail = text
    }
    
    var body: some View {
        TextField(title, text: $mail)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
    }
}
