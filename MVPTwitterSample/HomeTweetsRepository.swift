//
//  HomeTweetsRepository.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/10/23.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct HomeTweetsRepository {
    
    func getHomeTweets(completionHandler: @escaping (Result<JSON>) -> ()) {
        let request = Alamofire.request(NetworkRouter.getHomeTweets(parameters: [:]))
        
        request.responseJSON { response in
            switch response.result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let json):
                completionHandler(.success(JSON(json)))
            }
        }
    }
    
}
