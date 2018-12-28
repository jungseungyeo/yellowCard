//
//  NetWorkService.swift
//  yellowCard
//
//  Created by 여정승 on 27/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class YellowCardService{

    static let shared = YellowCardService()

    private init() { }

    private let headers = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNTQ1ODQxNjM1fQ.VGtvmsfPBvei8GNZmH-UM3OaZrJtTmpg31t0gd2nAOM",
                           "Content-Type":"application/json"]

    public enum Api {
        case base
        case signIn

        var path: String {
            switch self {
            case .base:
                return "https://yellowcard-api.herokuapp.com/"
            case .signIn:
                return Api.base.path + "signin"
            }
        }
    }

    func get(urlPath: String, parameters: [String : Any] = [:], handler: @escaping (JSON) -> Void, errorHandler: @escaping (Error?) -> Void) {
        Alamofire.request(urlPath, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { respose in
            switch respose.result {
            case .success(let value):
                print("value : \(value)")
                handler(JSON(respose.data!))
            case .failure(let error):
                errorHandler(error)
            }
        }
    }

    func post(url: Api, parameters: [String: Any] = [:], handler: @escaping (JSON) -> Void, errorHandler: @escaping (Error?) -> Void) {
        print(type(of: parameters))


        Alamofire.request( url.path, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { result in
            guard let statusCode = result.response?.statusCode, let data = result.data else {
                errorHandler(result.error)
                return
            }
            print("url : \(url.path)")
            print("data : \(data)")
            print("headers: \(self.headers)")

            switch statusCode {
            case 200 ... 299 :
                handler(JSON(data))
            default:
                errorHandler(result.error)
            }
        }
    }
}
