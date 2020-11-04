//
//  APIDeserializer.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation

class APIDeserializer<T: Any> {

    let decoder = JSONDecoder()
    var data: Data!

    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    init(data: Data) {
        self.data = data
    }

    func process() -> T? {
        fatalError("must be implemented in the subclass")
    }
}
