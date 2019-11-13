//
//  TwitterLoginViewController.swift
//  Code_Challenge
//
//  Created by Ravi, Divya on 7/8/19.
//

import ReactiveKit
import Bond

class TwitterLoginViewController: UIViewController {
    
    @IBOutlet private var userNameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var loadingIndicator: UIActivityIndicatorView!
    
    private let disposeBag = DisposeBag()
    private var loginVM: LoginVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginVM = LoginVM(loginTaps: loginButton.reactive.tap,
                          user: userNameTextField.reactive.text.toSignal(),
                          password: passwordTextField.reactive.text.toSignal())
        loginVM?.loginButtonEnabled.bind(to: loginButton.reactive.isEnabled)
    }
}
