//
//  UserPost.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-05.
//

import Foundation
class UserPost: Identifiable, Codable{
    var title: String
    var body: String
    var userName: String
    var createdAt: String
    var id: String
    
    init(title: String,body: String,userName: String,createdAt: String,id: String){
        self.title = title
        self.body = body
        self.userName = userName
        self.createdAt = createdAt
        self.id = id
    }
    
    func toMap() -> [String:Any]{
        let ref = DataBaseConstants()
        return [
            ref.title: title,
            ref.body: body,
            ref.createdAt: createdAt,
            ref.userName: userName,
            ref.id: id,

        ]
    }
}
