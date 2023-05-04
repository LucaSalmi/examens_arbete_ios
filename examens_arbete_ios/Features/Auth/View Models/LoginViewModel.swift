//
//  LoginViewModel.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
  // Input values from View
  @Published var userEmail = ""
  @Published var userPassword = ""
  
  // Output subscribers
  @Published var loginFormIsValid = false
  
  private var publishers = Set<AnyCancellable>()
  
  init() {
      isLoginFormValidPublisher
      .receive(on: RunLoop.main)
      .assign(to: \.loginFormIsValid, on: self)
      .store(in: &publishers)
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
          return password.count >= 8
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
}
