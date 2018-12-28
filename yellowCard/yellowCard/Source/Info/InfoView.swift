//
//  InfoView.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import SnapKit
import Then
import NVActivityIndicatorView

class InfoView: RootView {

    private let splashView: UIImageView = UIImageView(frame: .zero).then {
        $0.image = UIImage(named: "splash.png")
        $0.contentMode = .scaleAspectFill
    }

    override func setup() {
        super.setup()

        addSubviews(splashView)

        splashView.snp.makeConstraints { make -> Void in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
