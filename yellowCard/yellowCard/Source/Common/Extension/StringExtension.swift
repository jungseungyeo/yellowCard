//
//  StringExtension.swift
//  yellowCard
//
//  Created by Jung seoung Yeo on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

extension String {
    func attributedString(font: UIFont, textColor: UIColor) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
}
