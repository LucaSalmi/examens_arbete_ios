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
    
    func loginWithEmailAndPassword(eMail: String, password: String)  -> ResponseResult{
        
        var response = ResponseResult(resultType: .Initial)
        
        auth.signIn(withEmail: eMail, password: password){result, error in
            if(error != nil){
                response = ResponseResult(resultType: .Error, error: error)
            }else{
                response = ResponseResult(resultType: .Success)
            }
        }
        return response
    }
    
    func signOut()  {
        do{
            try auth.signOut()
        }catch{
            print(error)
        }
        
    }
    
}
