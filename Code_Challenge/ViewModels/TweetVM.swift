//
//  TweetVM.swift
//  Code_Challenge
//
//  Created by Ravi, Divya on 7/10/19.
//

import UIKit

class TweetVM: NSObject {
    var tweets = [Tweet]()
    
    override init() {
        super.init()
        tweets =  TwitterClient.shared.loadTimeline()
    }
}

// MARK: - UITableViewDataSource
extension TweetVM: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TwitterFeedTableViewCell.self)),
            let tweetCell = cell as? TwitterFeedTableViewCell
            else { return UITableViewCell() }
        tweetCell.user.text = tweets[indexPath.row].user
        tweetCell.content.text = tweets[indexPath.row].content
        return tweetCell
    }
}
