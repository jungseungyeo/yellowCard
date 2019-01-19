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
import SwiftyJSON

class LoginViewModel {
    typealias snsSuccess = (String?, KOUserMe) -> Void
    typealias isSuccess = () -> Void
    typealias isFailure = (Error?) -> Void
}

extension LoginViewModel {
    func isKakaoLogin(view: LoginViewController, success: @escaping snsSuccess, failure: @escaping isFailure) {

        guard let session = KOSession.shared() else {
            failure(nil)
            return
        }
        guard !session.isOpen() else {
            session.close()
            failure(nil)
            return
        }

        func errorAler() {
            let alert = UIAlertController.sheetConfirm("로그인 실패", message: "", defaultString: "확인", defaultHandler: nil)
            alert.show(view)
        }

        session.open(completionHandler: { error in
            guard error == nil else {
                failure(nil)
                return
            }

            func fetch(userInfo: KOUserMe, token: String) {
//                UserViewModel.shared.userInfo = Mapper<UserInfo>().map(JSON: ["tokenId": token, "name": userInfo.nickname!, "imageUrl": userInfo.profileImageURL!,"myStatusWord": "맥주는 역시 튀긴감자랑 함께해야지"])
//                 고정값
//                let imageUrlString = userInfo.profileImageURL!.absoluteString
//                UserDefaults.standard.set(token, forKey: "token")
//                UserDefaults.standard.set(userInfo.nickname!, forKey: "name")
//                UserDefaults.standard.set(imageUrlString, forKey: "imageUrl")
                YellowCardService.shared.makeHeaders(token: UserDefaults.standard.value(forKey: "token") as? String ?? "")
                view.indicator?.stopAnimating()
//                success()
            }

            KOSessionTask.userMeTask(completion: { (error, userInfo) in
//                view.indicator?.startAnimating()
                guard error == nil, let userInfo = userInfo else {
                    print("kakao Login error : \(String(describing: error))")
                    view.indicator?.stopAnimating()
                    errorAler()
                    failure(error)
                    return
                }
                success(session.token.accessToken, userInfo)



//                YellowCardService.shared.post(url: .signIn, parameters: ["access_token": session.token.accessToken], handler: { json in
                    //성공

//                    fetch(userInfo: userInfo, token: json["token"].stringValue)
//                }, errorHandler: { error in
//                    view.indicator?.stopAnimating()
//                    errorAler()
//                    failure(error)
//                })

            })
        })
    }
}

extension LoginViewModel {
    public func resquestMain(success: @escaping isSuccess, failure: @escaping isFailure) {
        let token = UserDefaults.standard.value(forKey: "token") as? String ?? ""
        YellowCardService.shared.makeHeaders(token: token)
        YellowCardService.shared.get(urlPath: .main, handler: { json in
            self.setupUserValue(token: token)
            self.setupMainValue(json: json)
            success()
        }, errorHandler: { error in
            failure(error)
        })
    }

    private func setupUserValue(token: String) {
        let image = UserDefaults.standard.value(forKey: "imageUrl") as? String ?? ""
        let name = UserDefaults.standard.value(forKey: "name") as? String ?? ""
        let imageUrl = URL(string: image)
        UserViewModel.shared.userInfo = Mapper<UserInfo>().map(JSON: ["tokenId": token, "name": name, "imageUrl": imageUrl ?? ""])
    }

    private func setupMainValue(json: JSON) {
        let drink_cards = json["drink_cards"].dictionaryValue
//        let dink_cards = Mapper<drink_cards>().map(JSON: ["drink_type": ""])

    }
}
