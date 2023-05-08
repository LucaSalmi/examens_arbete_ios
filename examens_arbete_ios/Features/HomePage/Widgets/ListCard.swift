//
//  ListCard.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-08.
//

import SwiftUI

struct ListCard: View {
    var currentPost: UserPost
    private let imageLink = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: imageLink, content: { phase in
                    switch phase{
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                    case .empty:
                        ProgressView("Loading...")
                    case .failure(let error):
                        Text(error.localizedDescription)
                    @unknown default:
                        Text("Unknown Error")
                        
                    }
                })
                
                VStack(alignment: HorizontalAlignment.leading, content: {
                    Text(currentPost.title).font(.system(size: 25))
                    Text(currentPost.body)
                }).padding([.leading])
            }.frame(maxWidth: .infinity, alignment: .leading).padding([.leading])
            HStack{
                Text(currentPost.userName).font(.system(size: 12))
                Text(currentPost.createdAt).font(.system(size: 12))
            }.frame(maxWidth: .infinity, alignment: .trailing).padding([.trailing])
        }
    }
}

func getDate() -> String{
    // get the current date and time
    let currentDateTime = Date()
    
    // initialize the date formatter and set the style
    let formatter = DateFormatter()
    formatter.timeStyle = .medium
    formatter.dateStyle = .long
    
    // get the date time String from the date object
    return formatter.string(from: currentDateTime)
}
