//
//  LoadingView.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-05.
//

import SwiftUI

struct LoadingView: View {
    @Binding var showLoading: Bool

    @State var fadeAlpha: CGFloat = 0.0 // start invisible
    var body: some View {
        VStack {
            Spacer ()
            ProgressView()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.9))
        .opacity(fadeAlpha)
        .animation(.easeIn, value: fadeAlpha)
        .onAppear { fadeAlpha = 1.0 } // animate to fully visible on appearance
    }
}
