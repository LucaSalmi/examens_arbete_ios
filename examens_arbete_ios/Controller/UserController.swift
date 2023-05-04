//
//  UserController.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import Foundation
import SwiftUI

//SINGLETON
class UserManager: ObservableObject{
    
    static let userManager = UserManager()
    var currentUser: User? = nil
    var userImage: UIImage? = nil
    @Published var imageArray : [String:UIImage] = [:]
    
}
