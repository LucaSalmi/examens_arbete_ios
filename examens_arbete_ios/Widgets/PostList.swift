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
        ListCard(currentPost: post)
      }

      if dataSource.isLoadingPage {
        ProgressView()
      }
    }
  }
}
