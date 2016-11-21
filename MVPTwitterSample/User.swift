//
//  User.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/09.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import SwiftyJSON

struct User {
    
    let id: String
    
    // (@)ktanaka117
    let screenName: String
    
    // ダンボー田中
    let name: String
    
    // プロフィール画像URL
    let profileImageURLString: String
    
    // 紹介文
    let description: String
    
    // ツイート数
    let statusesCount: String
    
    // フォロー数
    let friendsCount: String
    
    // フォロワー数
    let followersCount: String
    
    // お気に入り数
    let favoritesCount: String
    
    // ロケーション
    let location: String
    
    // デフォルト画像かどうか
    let isDefaultProfileImage: Bool
    
    // フォローしているかどうか
    let isFollowing: Bool
    
    // リストに入れられている数
    let listedCount: String
    
    init(json: JSON) {
        
        self.id                    = json["id_str"].stringValue
        self.screenName            = json["screen_name"].stringValue
        self.name                  = json["name"].stringValue
        self.profileImageURLString = json["profile_image_url_https"].stringValue
        self.description           = json["description"].stringValue
        self.statusesCount         = json["statuses_count"].stringValue
        self.friendsCount          = json["friends_count"].stringValue
        self.followersCount        = json["followers_count"].stringValue
        self.favoritesCount        = json["favorites_count"].stringValue
        self.location              = json["location"].stringValue
        self.isDefaultProfileImage = json["is_default_profile_image"].boolValue
        self.isFollowing           = json["is_following"].boolValue
        self.listedCount           = json["listed_count"].stringValue
        
    }
    
}
