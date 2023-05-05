//
//  ContentView.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import SwiftUI

struct ContentView: View {
        @State var isLoggedIn = false
    @ObservedObject var navigatorState = StateController.nav
        
            
        var body: some View {
            
            switch navigatorState.appState {
            case .Login:
                LoginView()
            case .HomePage:
                HomePage()
            }
        }
}
