//
//  ValidationHelper.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 19/05/22.
//

import Foundation
class Validation{
    // TODO: SHARED INSTANCE (SINGLETON OBJECT)
    static let shared:Validation = Validation()
    private init(){}
    
    // TODO: CHECK FOR TEXT IS EMPTY
    internal func isEmpty(text:String) -> Bool{
       return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}


