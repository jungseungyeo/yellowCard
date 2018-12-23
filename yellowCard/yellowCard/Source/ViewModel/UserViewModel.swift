//
//  File.swift
//  yellowCard
//
//  Created by 여정승 on 23/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import ObjectMapper
import RxSwift
import RxCocoa

class UserInfo: Mappable {

    var tokenId: Int?
    var name: String?
    var imageUrl: URL?

    required init?(map: Map) { }

    func mapping(map: Map) {
        self.tokenId    <- map["tokenId"]
        self.name       <- map["name"]
        self.imageUrl   <- map["imageUrl"]
    }
}

class testInfo {
    var name = Variable<String>("")
    var token = Variable<String>("")
}

class UserViewModel {

    static let shared = UserViewModel()

    public var userInfo: UserInfo?

    private init() { }
}
