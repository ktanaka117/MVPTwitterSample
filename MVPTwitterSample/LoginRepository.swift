//
//  Login.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/08.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Alamofire
import Social
import Accounts

enum LoginError: Error {
    case notGranted
}

// アカウント情報の取得はTwitterのAPIからではなくSocialとAccountsから行うため、APIRepositoryの準拠は不要
class LoginRepository {
    
    func login(completionHandler: @escaping (_ result: Result<Void>) -> ()) {
        
        if !SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) { return }
        
        let store = ACAccountStore()
        let type = store.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        store.requestAccessToAccounts(with: type, options: nil) { granted, error in
            
            // 承認されなかった場合
            if !granted {
                completionHandler(.failure(LoginError.notGranted))
                return
            }
            
            // 何らかのエラーがあった場合
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            let accounts = store.accounts(with: type)
            // FIXME: アカウント選択させよう
            if let account = accounts?.first as? ACAccount {
                Account.twitterAccount = account
                completionHandler(.success())
            }
        }
        
    }
    
}
