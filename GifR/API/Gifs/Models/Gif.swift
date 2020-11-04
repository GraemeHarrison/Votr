//
//  Gif.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation

class Gif {

    var uid: String?
    var imageOriginalUrl: URL?

    init(resource: GifResource) {
        
        let attributes = resource.data

        if let urlString = attributes.imageOriginalUrl, let url = URL(string: urlString) {
            imageOriginalUrl = url
        }
    }

    init(uid: String, url: String) {

        self.uid = uid

        if let url = URL(string: url) {
            imageOriginalUrl = url
        }
    }
}
