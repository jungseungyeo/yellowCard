//
//  UIColorExtension.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

extension UIColor {

    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }

    static let YellowCardBlack = UIColor(r: 0, g: 0, b: 0)
    static let YellowCardYellow = UIColor(r: 255, g: 228, b: 33)
    static let YellowCardBorderColor = UIColor(r: 17, g: 17, b: 17)
}
