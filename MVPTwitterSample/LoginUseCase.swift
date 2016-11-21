//
//  LoginUseCase.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/09/24.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Alamofire

class LoginUseCase {
    
    private let loginRepository = LoginRepository()
    
    func login(completionHandler: @escaping (Result<Void>) -> ()) {
        
        loginRepository.login(completionHandler: completionHandler)
        
    }
    
}
