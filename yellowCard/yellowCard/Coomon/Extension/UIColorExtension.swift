//
//  UIColorExtension.swift
//  yellowCard
//
//  Created by 여정승 on 16/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

extension UIColor {
    struct YellowCard {
        static let black = UIColor(r: 17, g: 17, b: 17)
        static let yellow = UIColor(r: 255, g: 228, b: 33)
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
}
