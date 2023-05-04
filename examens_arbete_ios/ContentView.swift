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
                LoginView(state: navigatorState)
            case .HomePage:
                LoginView(state: navigatorState)

            case .CreatePost:
                LoginView(state: navigatorState)

            
                
            }
        }
}
