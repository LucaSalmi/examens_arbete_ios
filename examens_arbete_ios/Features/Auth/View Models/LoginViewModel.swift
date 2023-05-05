//
//  LoginViewModel.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestoreSwift

final class LoginViewModel: ObservableObject {
    
    
    // Input values from View
    @Published var userEmail = ""
    @Published var userPassword = ""
    @Published var isLoading = false
    @Published var result = ResponseResult(resultType: .Initial)
    
    
    
    // Output subscribers
    @Published var loginFormIsValid = false
    @Published var userIsAuthenticated = false
    
    
    private var publishers = Set<AnyCancellable>()
    private let auth = Auth.auth()
    
    
    init() {
        isLoginFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.loginFormIsValid, on: self)
            .store(in: &publishers)
        
        isUserAuthenticated
            .receive(on: RunLoop.main)
            .assign(to: \.userIsAuthenticated, on: self)
            .store(in: &publishers)
        
        isUserAuthenticated.sink { result in
            if(result){

            }
        }.store(in: &publishers)
        
    }
    
    func loginUser(){
        self.isLoading = true
        auth.signIn(withEmail: userEmail, password: userPassword){result, error in
            self.isLoading = false
            if(error != nil){
                self.result = ResponseResult(resultType: .Error, error: error)
            }else{
                self.result = ResponseResult(resultType: .Success)
                StateController.nav.goToHomepage()
            }
        }
    }
}

// MARK: - Setup validations
private extension LoginViewModel {
    
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
    
    
    var isLoginFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(
            isUserEmailValidPublisher,
            isPasswordValidPublisher)
        .map { isEmailValid, isPasswordValid in
            return  isEmailValid && isPasswordValid
        }
        .eraseToAnyPublisher()
    }
    
    var isUserAuthenticated: AnyPublisher<Bool, Never> {
        $result.map { result in
            return result.error == nil && result.resultType == .Success
        }
        .eraseToAnyPublisher()
    }
}
