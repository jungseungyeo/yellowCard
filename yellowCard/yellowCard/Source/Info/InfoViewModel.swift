//
//  InfoViewModel.swift
//  yellowCard
//
//  Created by 여정승 on 06/01/2019.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import Foundation
import ObjectMapper

class InfoViewModel {

    typealias success = () -> Void
    typealias failure = (Error?) -> Void

    public func requestMain(view: InfoViewController, token: String, success: @escaping success, failure: @escaping failure) {
        view.indicator?.startAnimating()
        YellowCardService.shared.makeHeaders(token: token)
        YellowCardService.shared.get(urlPath: .main, handler: { json in
            view.indicator?.stopAnimating()
            let image = UserDefaults.standard.value(forKey: "imageUrl") as? String ?? ""
            let name = UserDefaults.standard.value(forKey: "name") as? String ?? ""
            let imageUrl = URL(string: image)
            UserViewModel.shared.userInfo = Mapper<UserInfo>().map(JSON: ["tokenId": token, "name": name, "imageUrl": imageUrl ?? ""])
            success()
        }, errorHandler: { error in
            view.indicator?.stopAnimating()
            failure(error)
        })
    }
}
