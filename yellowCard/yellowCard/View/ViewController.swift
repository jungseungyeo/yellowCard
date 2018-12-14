//
//  ViewController.swift
//  yellowCard
//
//  Created by 여정승 on 12/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import KakaoOpenSDK
import GoogleSignIn
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var loginWay: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let xMargin = 30 as CGFloat
        let marginBottom = 25 as CGFloat
        let btnWidth = self.view.frame.size.width - xMargin * 2
        let btnHeight = 42 as CGFloat
        
        let kakaoLoginButton = KOLoginButton(frame: CGRect(x: xMargin, y: self.view.frame.height - btnHeight - marginBottom - 50, width: btnWidth, height: btnHeight))

        self.view.addSubview(kakaoLoginButton)

        kakaoLoginButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
        let signInButton = GIDSignInButton(frame: CGRect(x: xMargin, y: self.view.frame.height - btnHeight - marginBottom - btnHeight - 100, width: btnWidth, height: btnHeight))
        self.view.addSubview(signInButton)
    }

    @objc
    private func tapped() {
//        KOSession.shared()?.open(completionHandler: { error in
            let session = KOSession.shared()
            
            if let s = session {
                if s.isOpen() {
                    s.close()
                }
                
                s.open(completionHandler: { error in
                    if error == nil {
                        print("no error")

                        if s.isOpen() {
                            KOSessionTask.userMeTask(completion: { error, file in
                                print("errorL: \(error)")
                                self.name.text = file?.nickname
//                                let url = URL(string: file!.profileImageURL)
                                let url = file!.profileImageURL
                                self.profileImg.kf.setImage(with: url)
                                self.loginWay.text = "카카오"
                            })
                        } else {
                            print("실패")
                        }
                    } else {
                        print("login error")
                    }
                })
            }else {
                print("세션 에러")
            }
//        })
        
        
    }

}

extension ViewController: GIDSignInUIDelegate, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard user.profile.name != nil else {
            return
        }
        self.name.text = user.profile.name
        self.profileImg.kf.setImage(with: user.profile.imageURL(withDimension: 400))
        self.loginWay.text = "구글 로그인"
    }
}
