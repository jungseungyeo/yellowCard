//
//  LoginViewModel.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import RxSwift
import RxCocoa

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

            func requestTokeId(userInfo: KOUserMe) {
                KOSessionTask.accessTokenInfoTask(completionHandler: { accessToken, error in
                    guard error == nil else {
                        failure(nil)
                        return
                    }
                    // 서버로 보내줘야 하는 토큰값
                    UserViewModel.shared.userInfo = UserInfo(JSON: ["tokenId": accessToken!.id!, "name": userInfo.nickname!, "imageUrl": userInfo.profileImageURL!])
                    success()
                })
            }

            KOSessionTask.userMeTask(completion: { error, userInfo in
                guard error == nil, let userInfo = userInfo else {
                    print("kakao Login error : \(String(describing: error))")
                    failure(nil)
                    return
                }
                requestTokeId(userInfo: userInfo)
            })
        })
    }
}
