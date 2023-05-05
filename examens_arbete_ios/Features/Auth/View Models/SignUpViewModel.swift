//
//  SignUpViewModel.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestoreSwift

final class SignUpViewModel: ObservableObject {
    
    // Input values from View
    @Published var userName = ""
    @Published var userEmail = ""
    @Published var userPassword = ""
    @Published var userRepeatedPassword = ""
    @Published var isLoading = false
    @Published var hasError = false
    @Published var result = ResponseResult(resultType: .Initial)
    
    // Output subscribers
    @Published var formIsValid = false
    
    private var publishers = Set<AnyCancellable>()
    private let auth = Auth.auth()
    
    
    init() {
        isSignupFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.formIsValid, on: self)
            .store(in: &publishers)
    }
    
    func signUpUser(){
        self.isLoading = true
        auth.createUser(withEmail: userEmail, password: userPassword){authResult, error in
            self.isLoading = false
            if(error != nil){
                self.hasError = true
                self.result = ResponseResult(resultType: .Error, error: error)
            }else{
                self.result = ResponseResult(resultType: .Success)
                StateController.nav.goToHomepage()
            }
        }
    }
}

// MARK: - Setup validations
private extension SignUpViewModel {
    
    var isUserNameValidPublisher: AnyPublisher<Bool, Never> {
        $userName
            .map { name in
                return name.count >= 5
            }
            .eraseToAnyPublisher()
    }
    
    var isUserEmailValidPublisher: AnyPublisher<Bool, Never> {
        $userEmail
            .map { email in
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                return emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }
    
    var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $userPassword
            .map { password in
                return password.count >= 6
            }
            .eraseToAnyPublisher()
    }
    
    
    var passwordMatchesPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($userPassword, $userRepeatedPassword)
            .map { password, repeated in
                return password == repeated
            }
            .eraseToAnyPublisher()
    }
    
    var isSignupFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(
            isUserNameValidPublisher,
            isUserEmailValidPublisher,
            isPasswordValidPublisher,
            passwordMatchesPublisher)
        .map { isNameValid, isEmailValid, isPasswordValid, passwordMatches in
            return isNameValid && isEmailValid && isPasswordValid && passwordMatches
        }
        .eraseToAnyPublisher()
    }
}
