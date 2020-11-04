//
//  GifClient.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation

class GifClient: APIClient {

    static func fetchRandomGif(completion: @escaping (Result<Gif?, Error>) -> ()) {
        performRequest(route: GifRouter.fetchRandomGif, deserializer: GifDeserializer(), completion: completion)
    }
}
