//
//  LoginValidator.swift
//  Code_Challenge
//
//  Created by Ravi, Divya on 7/9/19.
//

class LoginValidator {
    class func isValid(user: String?, password: String?) -> Bool {
        guard let user = user, let password = password else {
            return false
        }
        
        return !user.isEmpty && !password.isEmpty
    }
}

