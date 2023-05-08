//
//  HomePage.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import SwiftUI

struct HomePage: View {

    var body: some View {
        NavigationView{
            ZStack{
                EndlessList()
            }.toolbar{
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink("Create Post"){
                        CreatePostView()
                    }
                }
            }
        }
    }
}
