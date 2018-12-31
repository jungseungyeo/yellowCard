//
//  EncyclopediaViewModel.swift
//  yellowCard
//
//  Created by 여정승 on 31/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import UIKit
import ObjectMapper

class EncyclopediaViewModel {

    typealias isSuccess = () -> Void
    typealias isFailure = (Error?) -> Void

    public static func requestAlcol(success: @escaping isSuccess, failure: @escaping isFailure) {
        YellowCardService.shared.get(urlPath: .drinks, handler: { json in
            let jsonArray = json.arrayValue

            var enArray: [EncylopediaModel] = [EncylopediaModel]()
            for jsonObject in jsonArray {
                enArray.append(Mapper<EncylopediaModel>().map(JSON: jsonObject.dictionaryObject!)!)
            }
            UserViewModel.shared.encylopediaModels = enArray
            success()
        }, errorHandler: { error in
            print("error : \(String(describing: error?.localizedDescription))")
            failure(error)
        })
    }
}
