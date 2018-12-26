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
    static let YellowPageCountSelectColor = UIColor(r: 102, g: 102, b: 102)

    static let YellowCardGray = UIColor(r: 238, g: 238, b: 238)
    static let YellowLineGray = UIColor(r: 221, g: 221, b: 221)

    static let makgeolliBackgroundColor = UIColor(r: 117, g: 209, b: 248)
    static let sojuBackgroundColor = UIColor(r: 112, g: 236, b: 80)
    static let wineBackgroundColor = UIColor(r: 251, g: 122, b: 194)
    static let welcomeBackgroundColor = UIColor(r: 234, g: 234, b: 234)
}
