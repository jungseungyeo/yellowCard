//
//  LoginViewModel.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import RxSwift
import RxCocoa
import ObjectMapper

class LoginViewModel {
    typealias isSuccess = () -> Void
    typealias isFailure = (Error?) -> Void
}

extension LoginViewModel {
    func isKakaoLogin(success: @escaping isSuccess, failure: @escaping isFailure) {
        guard let session = KOSession.shared() else {
            failure(nil)
            return
        }
        guard !session.isOpen() else {
            session.close()
            failure(nil)
            return
        }
        session.open(completionHandler: { error in
            guard error == nil else {
                failure(nil)
                return
            }

            func fetch(userInfo: KOUserMe) {
                UserViewModel.shared.userInfo = Mapper<UserInfo>().map(JSON: ["tokenId": session.token.accessToken, "name": userInfo.nickname!, "imageUrl": userInfo.profileImageURL!])
                // 고정값
//                UserDefaults.standard.set(session.token.accessToken, forKey: "token")
//                UserDefaults.standard.set(userInfo.nickname!, forKey: "name")
//                UserDefaults.standard.set(userInfo.profileImageURL!, forKey: "imageUrl")

                success()
            }

            KOSessionTask.userMeTask(completion: { (error, userInfo) in
                guard error == nil, let userInfo = userInfo else {
                    print("kakao Login error : \(String(describing: error))")
                    failure(error)
                    return
                }

                YellowCardService.shared.post(url: .signIn, parameters: ["access_token": session.token.accessToken], handler: { json in
                    //성공
                    fetch(userInfo: userInfo)
                }, errorHandler: { error in
                    failure(error)
                })
                
            })
        })
    }
}
