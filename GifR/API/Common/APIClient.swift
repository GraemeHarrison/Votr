//
//  APIClient.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation
import Alamofire

class APIClient {
    
    internal static func performRequest<T: Any>(route: APIRouter, deserializer: APIDeserializer<T>, completion: @escaping (Result<T?, Error>) -> ()) {
        
        AF.request(route).validate().responseJSON { (response) in
                        
            switch response.result {
            
            case .success:

                let data = response.data
                deserializer.data = data
                completion(.success(deserializer.process()!))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
