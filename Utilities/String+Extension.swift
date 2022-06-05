//
//  String+Extension.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 19/05/22.
//

import Foundation

// MARK: - STRING EXTENSION FOR VALIDATION
extension String {
    
    // TODO: TO CHECK TEXT FIELD OR STRING IS BLANK OR NOT
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmed.isEmpty
        }
    }
    
    // TODO: TO CHECK VALID EMAIL
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    
    // TODO: TO CHECK VALID ALPHA NUMERIC COMBINATION
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    // TODO: TO CHECK VALID PASSWORD
    var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z_0-9\\-_,;.:#+*?=!§$%&/()@]+$", options: .caseInsensitive)
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil){
                
                if(self.count>=6 && self.count<=20){
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        } catch {
            return false
        }
    }
}
