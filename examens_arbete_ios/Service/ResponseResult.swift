//
//  ResponseResult.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import Foundation

enum Result: Int{
    
    case Initial = 0, Success ,Error
}

class ResponseResult{
    var resultType : Result = .Initial
    var error : Error? = nil
    
    init(resultType: Result, error: Error? = nil) {
        self.resultType = resultType
        self.error = error
    }
}
