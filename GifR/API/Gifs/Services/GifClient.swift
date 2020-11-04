//
//  GifClient.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation

class GifClient: APIClient {

    typealias Model = Result<Gif?, Error>
    typealias Models = Result<[Gif]?, Error>

    static func fetchRandomGif(completion: @escaping (Model) -> ()) {
        performRequest(route: GifRouter.fetchRandomGif, deserializer: GifDeserializer(), completion: completion)
    }
}
