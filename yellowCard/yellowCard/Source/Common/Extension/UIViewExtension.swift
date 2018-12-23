//
//  UIViewExtension.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

extension UIView {
    public func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
