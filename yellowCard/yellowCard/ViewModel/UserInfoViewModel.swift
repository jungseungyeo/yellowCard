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
            var imageURL: URL?
            var name: String?
            guard error == nil else {
                complete(false)
                return
            }

            func sendNetwork() {
                KOSessionTask.accessTokenInfoTask(completionHandler: { accessToken, error in
                    guard error == nil else {
                        complete(false)
                        return
                    }
                    // 서버로 보내줘야 하는 토큰값
                    let tokenId = accessToken?.id
                    let imageData = try! Data(contentsOf: imageURL!)
                    self.userInfo = UserInfo(JSON: ["userId": tokenId!, "name": name!, "profile": UIImage(data: imageData)!])
                    complete(true)
                })
            }

            KOSessionTask.userMeTask(completion: { error, userInfo in
                guard error == nil, let userInfo = userInfo else {
                    print("kakao Login error : \(String(describing: error))")
                    complete(false)
                    return
                }
//                let imageData = try! Data(contentsOf: userInfo.profileImageURL!)
//                self.userInfo = UserInfo(JSON: ["name": userInfo.nickname, "profile": UIImage(data: imageData)])
                name = userInfo.nickname!
                imageURL = userInfo.profileImageURL!

                sendNetwork()
            })
        })
    }
}
