//
//  Timeline.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/04/01.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Foundation

struct Timeline: DataType {
    
    typealias ItemType = Tweet
    
    var items: [ItemType] = []
    
    init(items: [ItemType]) {
        
        self.items = items
        
    }
    
    func getItems() -> [ItemType] {
        return items
    }
    
    func insert(item: ItemType, at index: Int) -> Timeline {
        
        var mutableTweets = items
        mutableTweets.insert(item, at: index)
        return Timeline(items: mutableTweets)
        
    }
    
    func delete(at index: Int) -> Timeline {
        
        var mutableTweets = items
        mutableTweets.remove(at: index)
        return Timeline(items: mutableTweets)
        
    }
    
    func favorite(at index: Int) -> Timeline {
        
        let cacheTweet = items[index]
        
        let tweet = Tweet(
            id: cacheTweet.id,
            text: cacheTweet.text,
            favorited: !cacheTweet.favorited,
            retweeted: cacheTweet.retweeted,
            user: cacheTweet.user
        )
        
        return delete(at: index).insert(item: tweet, at: index)
        
    }
    
    func retweet(at index: Int) -> Timeline {
        
        let cacheTweet = items[index]
        
        let tweet = Tweet(
            id: cacheTweet.id,
            text: cacheTweet.text,
            favorited: cacheTweet.favorited,
            retweeted: !cacheTweet.retweeted,
            user: cacheTweet.user
        )
        
        return delete(at: index).insert(item: tweet, at: index)
        
    }
    
}
