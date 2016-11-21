//
//  Router.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/09.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Alamofire
import Social

enum NetworkError: Error {
    case requestGeneration
}

enum NetworkRouter: URLRequestConvertible {
    
    case getHomeTweets(parameters: [String: Any])
    
    private var Method: SLRequestMethod {
        switch self {
        case .getHomeTweets:
            return .GET
        }
    }
    
    private var URLString: String {
        return "https://api.twitter.com/1.1/"
    }
    
    private var EndPoint: String {
        switch self {
        case .getHomeTweets:
            return "statuses/home_timeline.json"
        }
    }
    
    private var Parameters: [String: Any] {
        switch self {
        case .getHomeTweets(let parameters):
            return parameters
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let request = SLRequest(
            forServiceType: SLServiceTypeTwitter,
            requestMethod: Method,
            url: URL(string: URLString + EndPoint),
            parameters: Parameters
            ) else { throw NetworkError.requestGeneration }
        
        request.account = Account.twitterAccount
        
        return request.preparedURLRequest()
    }
    
}
