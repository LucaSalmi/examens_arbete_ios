//
//  ContentView.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import SwiftUI

struct ContentView: View {
        @State var isLoggedIn = false
        @ObservedObject var navigatorState : StateController
        
        init() {
            
            navigatorState = StateController()
        }
        
            
        var body: some View {
            
            switch navigatorState.appState {
                
            case .Login:
                LoginView(navigatorState: navigatorState)
            case .HomePage:
                HomePage(navigatorState: navigatorState)
            case .CreatePost:
                LoginView(navigatorState: navigatorState)
            case .RegisterUser:
                LoginView(navigatorState: navigatorState)
            case .Loading:
                LoginView(navigatorState: navigatorState)

            
                
            }
        }
}
