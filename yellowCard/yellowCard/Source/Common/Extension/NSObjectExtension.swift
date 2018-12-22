//
//  NSObjectExtension.swift
//  yellowCard
//
//  Created by 여정승 on 22/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation

public extension NSObject {
    public static var classNameToString: String{
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
