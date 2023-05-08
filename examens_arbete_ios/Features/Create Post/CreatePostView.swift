//
//  CreatePostView.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-08.
//

import SwiftUI

struct CreatePostView: View {
    
    @ObservedObject private var viewModel: CreatePostViewModel
    
    init(viewModel: CreatePostViewModel = CreatePostViewModel()) {
        self.viewModel = viewModel
    }
    var body: some View {
        // TODO: Add title text input field, body text input field and save button
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
