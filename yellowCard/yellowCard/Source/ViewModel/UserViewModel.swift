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

    var cardModel: [CardModel]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        self.tokenId    <- map["tokenId"]
        self.name       <- map["name"]
        self.imageUrl   <- map["imageUrl"]
    }
}

/// alcolType: nonalcoholic, beer, soju, wine, makgeolli
class CardModel {
    var alcolType: String?
    var mainTitle: String?

    init(alcolType: String, mainTitle: String) {
        self.alcolType = alcolType
        self.mainTitle = mainTitle
    }
}

class DemoModelGet {

    static var getUserInfoModel: UserInfo {
        let userInfo = UserInfo(JSON: ["tokenId": "temo", "name": "lin", "imageUrl": URL(string: "https://k.kakaocdn.net/dn/bTDccI/btqrgnDtPfC/cRPPxdIXyYJKVujjajVB6K/profile_640x640s.jpg")!])
        userInfo?.cardModel = getCardModel
        return userInfo!
    }

    static var getCardModel: [CardModel] {
        return [CardModel(alcolType: "beer", mainTitle: "3잔까지 깔끔하게"),
                CardModel(alcolType: "soju", mainTitle: "맥주랑 섞어서"),
                CardModel(alcolType: "wine", mainTitle: "치즈랑 같이"),
                CardModel(alcolType: "makgeolli", mainTitle: "사이다랑 같이")]
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
