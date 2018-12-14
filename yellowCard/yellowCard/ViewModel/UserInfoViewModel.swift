//
//  UserInfoViewModel.swift
//  yellowCard
//
//  Created by 여정승 on 14/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation

class UserInfoViewModel {
    var userInfo: UserInfo?

    private init() { }

    static let shared = UserInfoViewModel()

    func kakaoLogin(session: KOSession, complete: @escaping (Bool) -> Void) {
        session.open(completionHandler: { error in
            guard error == nil else {
                complete(false)
                return
            }

            KOSessionTask.userMeTask(completion: { error, userInfo in
                guard error == nil, let userInfo = userInfo else {
                    print("kakao Login error : \(String(describing: error))")
                    complete(false)
                    return
                }
                let imageData = try! Data(contentsOf: userInfo.profileImageURL!)
                self.userInfo?.profile = UIImage(data: imageData)
                self.userInfo?.name = userInfo.nickname
                complete(true)
            })
        })
    }
}
