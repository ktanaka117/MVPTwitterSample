//
//  Entity.swift
//  MVPTwitterSample
//
//  Created by 鈴木 大貴 on 2016/11/21.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import SwiftyJSON

protocol Entity {
    init?(json: JSON)
}
