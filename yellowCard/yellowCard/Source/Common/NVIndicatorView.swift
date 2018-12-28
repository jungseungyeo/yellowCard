//
//  NVIndicatorView.swift
//  yellowCard
//
//  Created by 여정승 on 27/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import NVActivityIndicatorView

class NVIndicatiorView {
    static func instance(_ viewController: UIViewController) -> NVActivityIndicatorView {
        let indicatorView = NVActivityIndicatorView(frame: .zero, type: NVActivityIndicatorType.init(rawValue: 4), color: UIColor.YellowCardYellow, padding: nil)

        viewController.view.addSubview(indicatorView)

        indicatorView.snp.makeConstraints { make -> Void in
            make.size.equalTo(40)
            make.center.equalToSuperview()
        }

        return indicatorView
    }
}
