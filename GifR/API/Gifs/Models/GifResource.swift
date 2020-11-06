//
//  GifResource.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation

struct GifResource: Decodable {

    struct Attributes: Decodable {

        let fixedWidthSmallUrl: String?
        let fixedWidthDownsampledUrl: String?
        let imageOriginalUrl: String?
        let imageWidth: String?
        let imageHeight: String?
    }

    let data: Attributes
}
