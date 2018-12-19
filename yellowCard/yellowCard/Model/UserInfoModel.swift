//
//  UserInfoModel.swift
//  yellowCard
//
//  Created by 여정승 on 14/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//
import ObjectMapper

class UserInfo: Mappable {
    var userId: NSNumber?
    var name: String?
    var profile: UIImage?

    required init?(map: Map) { }

    func mapping(map: Map) {
        self.userId     <- map["userId"]
        self.name       <- map["name"]
        self.profile    <- map["profile"]
    }
}
