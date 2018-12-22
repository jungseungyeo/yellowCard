//
//  ViewController.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import KakaoOpenSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let kakaoLoginButton = KOLoginButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 40, height: 50))
//
//        kakaoLoginButton.center = self.view.center
//        self.view.addSubview(kakaoLoginButton)
    }

    @IBAction func kakaoLoginButton(_ sender: Any) {

        guard let session = KOSession.shared() else {
            return
        }

        guard !session.isOpen() else {
            session.close()
            return
        }

        session.open(completionHandler: { error in


            KOSessionTask.userMeTask(completion: { error, userInfo in
                guard error == nil, let userInfo = userInfo else {
                    print("kakao Login error : \(String(describing: error))")
                    return
                }

                print(userInfo.nickname!)
                print(userInfo.profileImageURL!)
            })


        })

    }

}

