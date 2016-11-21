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

        return json.array?.flatMap { Tweet(json: $0 ) } ?? []

    }
    
}
