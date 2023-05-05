//
//  NavigatorState.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import Foundation
import UIKit

enum AppState: Int{
    
    case Login = 0, HomePage
}

// @Main Actor forces it to run on the main thread.
// this class contains the app state variable that controls the view flow, changing what view gets presented based on the value
// that it has. It also stores references to variables thet needs to move between views.
@MainActor class StateController: ObservableObject{
    
    static let nav = StateController()
    @Published var appState: AppState
    
    private init (){
     appState = AuthService().getCurrentUser() != nil ? .HomePage : .Login
    }
    
    func goToHomepage(){
        self.appState = .HomePage
    }
    func goToLogin(){
        self.appState = .Login
    }
}
