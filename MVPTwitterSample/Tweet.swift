//
//  Tweet.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/09.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import SwiftyJSON

struct Tweet: Entity {
    
    let id: String
    let text: String
    let favorited: Bool
    let retweeted: Bool
    let user: User
    
    init?(json: JSON) {
        
        guard
            let id        = json["id_str"].string,
            let text      = json["text"].string,
            let favorited = json["favorited"].bool,
            let retweeted = json["retweetes"].bool,
            let user      = User(json: json["user"])
        else {
            return nil
        }
        
        self.id        = id
        self.text      = text
        self.favorited = favorited
        self.retweeted = retweeted
        self.user      = user
        
    }
    
    init(id: String, text: String, favorited: Bool, retweeted: Bool, user: User) {
        
        self.id        = id
        self.text      = text
        self.favorited = favorited
        self.retweeted = retweeted
        self.user      = user
        
    }
    
}
