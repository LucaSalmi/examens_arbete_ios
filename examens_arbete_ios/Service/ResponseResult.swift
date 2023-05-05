//
//  ResponseResult.swift
//  examens_arbete_ios
//
//  Created by Luca Salmi on 2023-05-04.
//

import Foundation

enum ResultType: Int{
    
    case Initial = 0, Success ,Error
}

class ResponseResult{
    var resultType : ResultType = .Initial
    var error : Error? = nil
    
    init(resultType: ResultType, error: Error? = nil) {
        self.resultType = resultType
        self.error = error
    }
}
