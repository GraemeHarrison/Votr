//
//  APIRouter.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation
import Alamofire

enum HTTPHeaderField: String {
    
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

internal protocol APIRouter: URLRequestConvertible {

    var baseUrl: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var headers: [String: String]? { get }
}

extension APIRouter {

    func asURLRequest() throws -> URLRequest {

        let url = URL(string: "https://" + baseUrl)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        if let headers = headers {

            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        if let parameters = parameters {

            var encodedURLRequest: URLRequest

            do {
                switch method {
                case .get: encodedURLRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                default: encodedURLRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
                }
                return encodedURLRequest
            }
            catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
