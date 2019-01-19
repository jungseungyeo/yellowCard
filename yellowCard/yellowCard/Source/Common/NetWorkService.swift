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

    private var headers = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNTQ1ODQxNjM1fQ.VGtvmsfPBvei8GNZmH-UM3OaZrJtTmpg31t0gd2nAOM",
                           "Content-Type":"application/json"]

    public func makeHeaders(token: String) {
        headers = ["Authorization": "Bearer \(token)",
                    "Content-Type":"application/json"]
    }

    public enum Api {
        case base
        case signIn
        case main
        case drinks

        var path: String {
            switch self {
            case .base:
                return "https://yellowcard-api.herokuapp.com/"
            case .signIn:
                return Api.base.path + "signin"
            case .main:
                return Api.base.path + "main"
            case .drinks:
                return Api.base.path + "drinks"
            }
        }
    }

    func get(urlPath: Api, parameters: [String : Any] = [:], handler: @escaping (JSON) -> Void, errorHandler: @escaping (Error?) -> Void) {
        
        Alamofire.request(urlPath.path, method : .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { result in
            guard let statusCode = result.response?.statusCode, let data = result.data else {
                errorHandler(result.error)
                return
            }
            switch statusCode {
            case 200 ... 299 :
                print("path: \(urlPath.path)")
                print(JSON(data))
                handler(JSON(data))
            default:
                print("error status : \(statusCode)")
                errorHandler(result.error)
            }
        }
    }

    func post(url: Api, parameters: [String: Any] = [:], handler: @escaping (JSON) -> Void, errorHandler: @escaping (Error?) -> Void) {
        Alamofire.request( url.path, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { result in
            guard let statusCode = result.response?.statusCode, let data = result.data else {
                errorHandler(result.error)
                return
            }
            switch statusCode {
            case 200 ... 299 :
                print("path: \(url.path)")
                print(JSON(data))
                handler(JSON(data))
            default:
                print("error status : \(statusCode)")
                errorHandler(result.error)
            }
        }
    }
}
