//
//  TweetsTranslater.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/09/26.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import SwiftyJSON

class TweetsTranslater {
    
    func translate(json: JSON) -> [Tweet] {
        
        var tweets: [Tweet] = []
        
        guard let tweetsData = json.array else { return [] }
        
        for data in tweetsData {
            let user = User(json: data["user"])
            let tweet = Tweet(json: data, user: user)
            tweets.append(tweet)
        }
        
        return tweets
        
    }
    
}
