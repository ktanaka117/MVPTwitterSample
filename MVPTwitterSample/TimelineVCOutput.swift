//
//  TimelineTableVCOutput.swift
//  MVPTwitterSample
//
//  Created by 田中賢治 on 2016/11/21.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Foundation

protocol TimelineVCOutput: class {
    func showEmptyView()
    func hideEmptyView()
    func showTimeline(timeline: Timeline)
}
