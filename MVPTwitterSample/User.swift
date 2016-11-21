//
//  User.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/09.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import SwiftyJSON

struct User: Entity {
    
    let id: String
    
    // (@)ktanaka117
    let screenName: String
    
    // ダンボー田中
    let name: String
    
    // プロフィール画像URL
    let profileImageURL: URL
    
    // 紹介文
    let description: String
    
    // ツイート数
    let statusesCount: Int
    
    // フォロー数
    let friendsCount: Int
    
    // フォロワー数
    let followersCount: Int
    
    // お気に入り数
    let favoritesCount: Int
    
    // ロケーション
    let location: String
    
    // デフォルト画像かどうか
    let isDefaultProfileImage: Bool
    
    // フォローしているかどうか
    let isFollowing: Bool
    
    // リストに入れられている数
    let listedCount: String
    
    init?(json: JSON) {
        
        guard
            let id                    = json["id_str"].string,
            let screenName            = json["screen_name"].string,
            let name                  = json["name"].string,
            let profileImageURLString = json["profile_image_url_https"].string,
            let profileImageURL       = URL(string: profileImageURLString),
            let description           = json["description"].string,
            let statusesCount         = json["statuses_count"].int,
            let friendsCount          = json["friends_count"].int,
            let followersCount        = json["followers_count"].int,
            let favoritesCount        = json["favorites_count"].int,
            let location              = json["location"].string,
            let isDefaultProfileImage = json["is_default_profile_image"].bool,
            let isFollowing           = json["is_following"].bool,
            let listedCount           = json["listed_count"].string
        else {
            return nil
        }
        
        self.id                    = id
        self.screenName            = screenName
        self.name                  = name
        self.profileImageURL       = profileImageURL
        self.description           = description
        self.statusesCount         = statusesCount
        self.friendsCount          = friendsCount
        self.followersCount        = followersCount
        self.favoritesCount        = favoritesCount
        self.location              = location
        self.isDefaultProfileImage = isDefaultProfileImage
        self.isFollowing           = isFollowing
        self.listedCount           = listedCount
        
    }
    
}
