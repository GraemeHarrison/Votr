//
//  GifDeserializer.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation
import SwiftyJSON

class GifDeserializer: APIDeserializer<Gif> {
    
    override func process() -> Gif? {

//        print("json: \(try! JSON(data: data))")

        if let giphyResource = try? decoder.decode(GifResource.self, from: data) {
            return Gif(resource: giphyResource)
        }
        return nil
    }
}
