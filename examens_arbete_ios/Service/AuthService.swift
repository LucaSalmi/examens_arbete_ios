//
//  AuthService.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import SwiftUI
import Combine

class AuthService : ObservableObject {
    
    private let auth = Auth.auth()
    
    func getCurrentUser() -> User?{
        return auth.currentUser
    }
    
    func signOut()  {
        do{
            try auth.signOut()
        }catch{
            print(error)
        }
        
    }
    
}
