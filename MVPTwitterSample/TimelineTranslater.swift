//
//  TimelineTranslater.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/09/05.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Foundation

class TimelineTranslater {
    
    func translate(tweets: [Tweet]) -> Timeline {
        
        return Timeline(items: tweets)
        
    }
    
}
