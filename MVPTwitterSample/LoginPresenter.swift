//
//  LoginPresenter.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/09/24.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit

class LoginPresenter {
    
    private weak var loginVCOutput: LoginVCOutput!
    
    required init(output: LoginVCOutput) {
        self.loginVCOutput = output
    }
    
    private let loginUseCase = LoginUseCase()
    
    func login() {
        loginUseCase.login { [weak self] result in
            switch result {
            case .failure(let error):
                self?.loginVCOutput?.showErrorDialogue()
            case .success:
                self?.loginVCOutput?.dismiss()
            }
        }
    }
    
}
