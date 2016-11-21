//
//  TimelinePresenter.swift
//  MVPTwitterSample
//
//  Created by 田中賢治 on 2016/11/21.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Foundation

class TimelinePresenter {
    
    private weak var timelineVCOutput: TimelineVCOutput!
    private let timelineUseCase = TimelineUseCase()
    
    init(output timelineVCOutput: TimelineVCOutput) {
        self.timelineVCOutput = timelineVCOutput
    }
    
    func getTimeline() {
        timelineUseCase.getTimeline { [weak self] result in
            switch result {
            case .failure(let error):
                self?.timelineVCOutput.showEmptyView()
            case .success(let timeline):
                self?.timelineVCOutput.hideEmptyView()
                self?.timelineVCOutput.showTimeline(timeline: timeline)
            }
        }
    }
    
}
