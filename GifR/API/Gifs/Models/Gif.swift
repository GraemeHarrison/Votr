//
//  Gif.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation

class Gif {

    var url: String!

    init(resource: GifResource) {

        let attributes = resource.data
        url = attributes.url
    }
}
