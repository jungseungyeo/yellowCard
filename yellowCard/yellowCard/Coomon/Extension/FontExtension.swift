//
//  FontExtension.swift
//  yellowCard
//
//  Created by 여정승 on 14/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit

extension UIFont {
    enum spoqaType: String {
        case Bold
        case Thin
        case Regular
        case Light

        var fontName: String {
            switch self {
            case .Bold: return "SpoqaHanSans-Bold"
            case .Thin: return "SpoqaHanSans-Thin"
            case .Regular: return "SpoqaHanSans-Regular"
            case .Light: return "SpoqaHanSans-Light"
            }
        }

        var weight: UIFont.Weight {
            switch self {
            case .Bold: return .bold
            case .Thin: return .thin
            case .Regular: return .regular
            case .Light: return .light
            }
        }
    }

    static func spoqaFont(ofSize: CGFloat, weight: spoqaType) -> UIFont {
        guard let customFont = UIFont(name: weight.fontName, size: ofSize) else {
            return .systemFont(ofSize: ofSize, weight: weight.weight)
        }
        return customFont
    }
}
