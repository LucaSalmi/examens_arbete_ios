//
//  ListContentViewModel.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-05.
//

import Foundation
import Combine
import FirebaseCore
import FirebaseFirestore

class ContentDataSource: ObservableObject {
    @Published var posts = [UserPost]()
    @Published var isLoadingPage = false
    private var currentPage = 1
    private var canLoadMorePages = true
    let db = Firestore.firestore()
    
    init() {
        loadPosts()
    }
    
    func loadPosts() {
        db.collection("posts").addSnapshotListener {querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            for document in documents {
                let result = Result {
                    try document.data(as: UserPost.self)
                }
                switch result {
                case .success(let post) :
                    self.posts.append(post)
                case .failure(let error) :
                    print("Error decoding item: \(error)")
                }
            }
            
            if(self.self.posts.count > 0){
                self.posts = self.posts.sorted(by: { $0.createdAt.compare($1.createdAt) == .orderedDescending })
            }
        }
    }
    
    
}
