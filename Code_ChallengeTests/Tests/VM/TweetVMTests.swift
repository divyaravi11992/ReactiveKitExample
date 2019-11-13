//
//  TweetVMTests.swift
//  Code_ChallengeTests
//
//  Created by Ravi, Divya on 7/12/19.
//

import XCTest

class TweetVMTests: XCTestCase {

    func testTweets() {
        let vm = TweetVM.init()
        XCTAssertTrue(!vm.tweets.isEmpty)
    }
}
