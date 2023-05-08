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
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            VStack {
                Form {
                    Section {
                        TextField("Title", text: $viewModel.title)
                        TextField("Body", text: $viewModel.body, axis: .vertical)
                    }
                    
                    Button("Save") {
                        viewModel.saveNewPost(presentView: presentationMode)
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
