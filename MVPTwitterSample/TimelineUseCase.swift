//
//  TimelineUseCase.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/08/23.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Alamofire
import SwiftyJSON

enum TimelineUseCaseError: Error {
    case timelineTranslation
    case tweetsTranslation
}

class TimelineUseCase {
    
    private let homeTweetsRepository = HomeTweetsRepository()
    private let timelineTranslater = TimelineTranslater()
    private let tweetsTranslater = TweetsTranslater()
    
    // タイムラインを取得する処理
    func getTimeline(completionHandler: @escaping (Result<Timeline>) -> ()) {
        
        getTweets { [weak self] result in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let tweets):
                guard let timeline = self?.timelineTranslater.translate(tweets: tweets) else {
                    completionHandler(.failure(TimelineUseCaseError.timelineTranslation))
                    return
                }
                
                completionHandler(.success(timeline))
            }
            
        }
        
    }
    
    // ツイートを取得する処理
    private func getTweets(completionHandler: @escaping (Result<[Tweet]>) -> ()) {
        
        homeTweetsRepository.getHomeTweets { [weak self] result in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let json):
                guard let tweets = self?.tweetsTranslater.translate(json: json) else {
                    completionHandler(.failure(TimelineUseCaseError.tweetsTranslation))
                    return
                }
                
                completionHandler(.success(tweets))
            }
        }
        
    }
    
}
