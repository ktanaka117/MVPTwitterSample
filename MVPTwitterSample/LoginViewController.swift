//
//  LoginViewController.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/09/24.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginPresenter: LoginPresenter?
    
    var didLogin: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPresenter = LoginPresenter(output: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loginPresenter?.login()
    }
    
}

extension LoginViewController: LoginVCOutput {
    
    func dismiss() {
        didLogin?()
        dismiss(animated: true, completion: nil)
    }
    
    func showErrorDialogue() {
        
    }
    
}
