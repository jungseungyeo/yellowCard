//
//  InfoViewController.swift
//  yellowCard
//
//  Created by 여정승 on 14/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    static func instance() -> InfoViewController? {
        return UIStoryboard(name: "Info", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? InfoViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
