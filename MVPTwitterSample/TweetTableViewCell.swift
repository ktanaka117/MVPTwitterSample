//
//  TweetTableViewCell.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/03/01.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.image = nil
    }
    
    func fill(withTweet tweet: Tweet) {
        
        iconImageView.af_setImage(withURL: URL(string: tweet.user.profileImageURLString)!)
        screenNameLabel.text = "@\(tweet.user.screenName)"
        nameLabel.text = tweet.user.name
        descriptionLabel.text = tweet.text
        
    }
    
}
