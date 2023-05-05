//
//  PostList.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-05.
//

import SwiftUI

struct EndlessList: View {
  @StateObject var dataSource = ContentDataSource()

  var body: some View {
    List {
      ForEach(dataSource.posts) { post in
        Text(post.title)
          .padding(.all, 30)
      }

      if dataSource.isLoadingPage {
        ProgressView()
      }
    }
  }
}
