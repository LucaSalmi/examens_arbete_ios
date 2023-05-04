//
//  User.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import Foundation

class User: Codable, Identifiable {
    
    var id : String = UUID().uuidString
     var username : String = ""
     var email : String = ""
     var password : String = ""
}
