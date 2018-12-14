//
//  InfoViewController.swift
//  yellowCard
//
//  Created by 여정승 on 14/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import Lottie

class InfoViewController: UIViewController {

    @IBOutlet weak var loadingView: LOTAnimationView!

    static func instance() -> InfoViewController? {
        return UIStoryboard(name: "Info", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? InfoViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lottieSetup()
    }

    private func lottieSetup() {
        loadingView.setAnimation(named: "swiftkey-logo")
        loadingView.loopAnimation = false
        loadingView.play(completion: { animationFinished in
            if animationFinished {
                self.present(LoginViewController.instance()!, animated: false, completion: nil)
            }
        })
    }
    
}
