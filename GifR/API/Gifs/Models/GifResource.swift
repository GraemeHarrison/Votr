//
//  GifResource.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation

struct GifResource: Decodable {

    struct Attributes: Decodable {
        let url: String?
        let imageOriginalUrl: String?
    }

    let data: Attributes
}
