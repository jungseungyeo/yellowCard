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

    var isToken = Variable<Bool>(false)
    var isName = Variable<Bool>(false)
    var isImageUrl = Variable<Bool>(false)


    var isLoginFlag: Observable<Bool> {
        return Observable.combineLatest( isToken.asObservable(), isName.asObservable(), isImageUrl.asObservable()) { isToken, isName, isImageUrl in
            isToken && isName && isImageUrl
        }
    }

}

extension LoginViewModel: LoginViewdelegate {
    func kakaoButtonTapped(sender: UITapGestureRecognizer) {
        guard let session = KOSession.shared() else {
            return
        }
        guard !session.isOpen() else {
            session.close()
            return
        }
        session.open(completionHandler: { error in
            guard error == nil else {
                return
            }

            KOSessionTask.userMeTask(completion: { error, userInfo in
                guard error == nil, let userInfo = userInfo else {
                    print("kakao Login error : \(String(describing: error))")
                    return
                }
//                UserViewModel.shared.userInfo = UserInfo(JSON: ["name": userInfo.nickname!, "imageUrl": userInfo.profileImageURL!])
            })
        })
    }
}
