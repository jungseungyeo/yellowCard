//
//  LoginViewController.swift
//  yellowCard
//
//  Created by 여정승 on 14/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import GoogleSignIn
import PopupDialog

class LoginViewController: UIViewController {

    private let loginView = LoginView()

    static func instance() -> LoginViewController? {
        return UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? LoginViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        self.view = loginView
        setup()
    }

    private func setup() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
}

extension LoginViewController: GIDSignInUIDelegate, GIDSignInDelegate, LoginButtonDelegate {

    func kakaoLoginTapped(view: LoginView) {
        guard let session = KOSession.shared() else {
            return
        }

        guard !session.isOpen() else {
            session.close()
            return
        }
        UserInfoViewModel.shared.kakaoLogin(session: session, complete: { result in
            guard result else {
                // 실패
                let popup = PopupDialog(title: "로그인 실패", message: "")
                let buttonOne = CancelButton(title: "확인") {
                    print("You canceled the car dialog.")
                }
                popup.addButton(buttonOne)
                self.present(popup, animated: true, completion: nil)
                return
            }
            // 성공
            print("카카오 로그인 성공")
//            let popup = PopupDialog(title: "로그인 성공", message: "이름 : \(UserInfoViewModel.shared.userInfo?.name!)")
            let popup = PopupDialog(title: "카카오 로그인 성공", message: "이름 : \(String(describing: UserInfoViewModel.shared.userInfo?.name!))", image: UserInfoViewModel.shared.userInfo?.profile!)
            let buttonOne = CancelButton(title: "확인") {
            }
            popup.addButton(buttonOne)
            self.present(popup, animated: true, completion: {
                self.logoutKakao(session: session)
            })
        })

    }

    func logoutKakao(session: KOSession) {
        session.logoutAndClose(completionHandler: { success, error in
            if success {
                session.close()
            }
        })
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard error == nil else {
            let popup = PopupDialog(title: "로그인 실패", message: "")
            let buttonOne = CancelButton(title: "확인") {
                print("You canceled the car dialog.")
            }
            popup.addButton(buttonOne)
            self.present(popup, animated: true, completion: nil)
            return
        }
        let imageData = try! Data(contentsOf: user.profile.imageURL(withDimension: 400))
        UserInfoViewModel.shared.userInfo = UserInfo(JSON: ["name": user.profile.name, "profile": UIImage(data: imageData)])
        let popup = PopupDialog(title: "구글 로그인 성공", message: "이름 : \(String(describing: UserInfoViewModel.shared.userInfo?.name!))", image: UserInfoViewModel.shared.userInfo?.profile!)
        let buttonOne = CancelButton(title: "확인") {
            print("You canceled the car dialog.")
        }
        popup.addButton(buttonOne)
        self.present(popup, animated: true, completion: nil)
    }
}
