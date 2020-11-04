//
//  Gif.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation

class Gif {

    var url: URL?
    var imageOriginalUrl: URL?

    init(resource: GifResource) {
        
        let attributes = resource.data

        if let attributeUrl = attributes.url, let url = URL(string: attributeUrl) {
            self.url = url
        }

        if let attributeUrl = attributes.imageOriginalUrl, let url = URL(string: attributeUrl) {
            self.imageOriginalUrl = url
        }
    }
}
