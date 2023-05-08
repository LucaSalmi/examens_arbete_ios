//
//  CreatePostViewModel.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-08.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestoreSwift

final class CreatePostViewModel: ObservableObject {
    
    // Input values from View
    @Published var title = ""
    @Published var body = ""
    @Published var isLoading = false
    @Published var hasError = false
    @Published var result = ResponseResult(resultType: .Initial)
    
    // Output subscribers
    @Published var formIsValid = false
    
    private var publishers = Set<AnyCancellable>()
    private let db = Firestore.firestore()
    private let auth = Auth.auth()

    
    init() {
        isNewPostValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.formIsValid, on: self)
            .store(in: &publishers)
    }
    
    func signUpUser(){
        self.isLoading = true
        let newPost = UserPost(title: title, body: body, userName: auth.currentUser?.email ?? "Anonymous", createdAt: getDate(), id: db.collection("posts").document().documentID)
        // TODO: Add function to save to Firestore
    }
    
    func getDate() -> String{
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        
        // get the date time String from the date object
        return formatter.string(from: currentDateTime)
    }
}

// MARK: - Setup validations
private extension CreatePostViewModel {
    
    var isTitleValidPublisher: AnyPublisher<Bool, Never> {
        $title
            .map { title in
                return title != ""
            }
            .eraseToAnyPublisher()
    }
    
    var isBodyValidPublisher: AnyPublisher<Bool, Never> {
        $body
            .map { body in
                return body != ""
            }
            .eraseToAnyPublisher()
    }
    
    var isNewPostValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(
            isTitleValidPublisher,
            isBodyValidPublisher)
        .map { isTitleValid, isBodyValid in
            return isTitleValid && isBodyValid
        }
        .eraseToAnyPublisher()
    }
}
