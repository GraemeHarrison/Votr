//
//  GifRouter.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation
import Alamofire

enum GifRouter: APIRouter {

    case fetchRandomGif

    var method: HTTPMethod {

        switch self {
        case .fetchRandomGif: return .get
        }
    }

    var baseUrl: String {

        switch self {
        case .fetchRandomGif: return "api.giphy.com/"
        }
    }

    var path: String {

        switch self {
        case .fetchRandomGif: return "v1/gifs/random"
        }
    }

    var parameters: Parameters? {

        switch self {
        case .fetchRandomGif:
            return [
                "api_key": Bundle.main.infoDictionary!["GIPHY_API_KEY"] as! String,
                "tag": "election"
            ]
        }
    }

    var headers: [String : String]? {
        return nil
    }
}
