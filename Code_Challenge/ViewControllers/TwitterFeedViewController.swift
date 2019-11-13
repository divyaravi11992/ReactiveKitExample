//
//  TwitterFeedViewController.swift
//  Code_Challenge
//
//  Created by Ravi, Divya on 7/8/19.
//

import UIKit
import ReactiveKit
import Bond

class TwitterFeedViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var logoutButton: UIButton!
    fileprivate let tweetVM = TweetVM()
    private var loginVM: LoginVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        loginVM = LoginVM(logoutTaps: logoutButton.reactive.tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpTableView() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = .zero
        tableView.bounces = false
        tableView.dataSource = tweetVM
        tableView.register(UINib(nibName: String(describing: TwitterFeedTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: TwitterFeedTableViewCell.self))
    }
}
