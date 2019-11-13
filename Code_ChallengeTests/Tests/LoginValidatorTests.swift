//
//  LoginValidatorTests.swift
//  Code_ChallengeTests
//
//  Created by Ravi, Divya on 7/12/19.
//

import XCTest

class LoginValidatorTests: XCTestCase {
    
    func testEmpty() {
        XCTAssertFalse(LoginValidator.isValid(user: "", password: ""))
        XCTAssertFalse(LoginValidator.isValid(user: nil, password: nil))
        XCTAssertFalse(LoginValidator.isValid(user: "user", password: ""))
        XCTAssertFalse(LoginValidator.isValid(user: "", password: "password"))
    }
    
    func testNonEmpty() {
        XCTAssertTrue(LoginValidator.isValid(user: "user", password: "password"))
    }
    
}
