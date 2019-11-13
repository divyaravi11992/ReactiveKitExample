//
//  LoginVMTests.swift
//  Code_ChallengeTests
//
//  Created by Ravi, Divya on 7/12/19.
//

@testable import Code_Challenge
import Quick
import Nimble
import Bond
import ReactiveKit

class LoginViewModelSpec: QuickSpec {
    var logintaps = SafePublishSubject<Void>()
    var logouttaps = SafePublishSubject<Void>()
    var user = SafePublishSubject<String?>()
    var password = SafePublishSubject<String?>()
    var viewModel: LoginVM!
    
    override func spec() {
        beforeEach() {
            self.viewModel = LoginVM(loginTaps: self.logintaps.toSignal(),
                                            user: self.user.toSignal(),
                                            password: self.password.toSignal())
        }
        
        describe("the login view model") {
            
            it("should disable login button if user and password are empty") {
                self.user.next("")
                self.password.next("")
                expect(self.viewModel.loginButtonEnabled.value) == false
            }
            
            it("should disable login button if only user are empty") {
                self.user.next("")
                self.password.next("password")
                expect(self.viewModel.loginButtonEnabled.value) == false
            }
            
            it("should disable login button if only password are empty") {
                self.user.next("someUser")
                self.password.next("")
                expect(self.viewModel.loginButtonEnabled.value) == false
            }
            
            it("should enable login button if user and password aren't empty") {
                self.user.next("someUser")
                self.password.next("password")
                expect(self.viewModel.loginButtonEnabled.value) == true
            }
            
            it("should update token if login is sucessfull") {
                self.user.next("user")
                self.password.next("password")
                self.logintaps.next()
                expect(TwitterClient.shared.isLoggedIn.value) == true
            }
            
            it("should update error message if login fails") {
                expect(TwitterClient.shared.isLoggedIn.value) == true
            }
            
            it("should update error message if login fails") {
                self.viewModel = LoginVM(logoutTaps: self.logouttaps.toSignal())
                self.logouttaps.next()
                expect(TwitterClient.shared.isLoggedIn.value) == false
            }
            
            it("should update error message if login fails") {
                self.user.next("abc")
                self.password.next("xyz")
                self.logintaps.next()
                expect(TwitterClient.shared.isLoggedIn.value) == false
            }
        }
    }
}
