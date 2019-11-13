//
//  LoginVM.swift
//  Code_Challenge
//
//  Created by Ravi, Divya on 7/9/19.
//

import ReactiveKit
import Bond

protocol TwitterLoginControllerDelegate: class {
    func pushScreen()
}

class LoginVM {
    private let disposeBag = DisposeBag()
    private var currentUser = ""
    private var currentPassword = ""
    weak var delegate: TwitterLoginControllerDelegate?
    let loginButtonEnabled = Property<Bool>(false)
    
    init(loginTaps: SafeSignal<Void>, user: SafeSignal<String?>,
         password: SafeSignal<String?>) {
        self.delegate = self
        loginTaps.observeNext(with: {[weak self] in
            guard let strongSelf = self else { return }
            strongSelf.login()
            strongSelf.pushScreen()
        }).dispose(in: disposeBag)
        
        combineLatest(user, password).observeNext {[weak self] user, password in
            guard let strongSelf = self else { return }
            if let user = user, let password = password {
                strongSelf.currentUser = user
                strongSelf.currentPassword = password
            }
            strongSelf.loginButtonEnabled.value = LoginValidator.isValid(user: user, password: password)
            }.dispose(in: disposeBag)
    }
    
    init(logoutTaps: SafeSignal<Void>) {
        self.delegate = self
        logoutTaps.observeNext(with: {[weak self] in
            guard let strongSelf = self else { return }
            strongSelf.logout()
            strongSelf.pushScreen()
        }).dispose(in: disposeBag)
    }
    
    private func login() {
        TwitterClient.shared.logIn(username: currentUser, password: currentPassword)
    }
    
    private func logout() {
        TwitterClient.shared.logOut()
    }
}

extension LoginVM: TwitterLoginControllerDelegate {
    func pushScreen() {
        let vc =  TwitterClient.shared.isLoggedIn.value
            ? TwitterFeedViewController() : TwitterLoginViewController()
        let rootViewController = UINavigationController(rootViewController: vc)
        UIApplication.shared.keyWindow?.rootViewController = rootViewController
    }
}
