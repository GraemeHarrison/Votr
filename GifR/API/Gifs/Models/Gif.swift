//
//  Gif.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import UIKit

class Gif {

    enum Key: String {
        case uid
        case imageOriginalUrl
        case imageWidth
        case imageHeight
    }

    var uid: String?
    var fixedWidthSmallUrl: URL?
    var fixedWidthDownsampledUrl: URL?
    var imageOriginalUrl: URL?
    var imageWidth: CGFloat?
    var imageHeight: CGFloat?

    init(resource: GifResource) {
        
        let attributes = resource.data

        if let urlString = attributes.fixedWidthSmallUrl, let url = URL(string: urlString) {
            fixedWidthSmallUrl = url
        }

        if let urlString = attributes.fixedWidthDownsampledUrl, let url = URL(string: urlString) {
            fixedWidthDownsampledUrl = url
        }

        if let urlString = attributes.imageOriginalUrl, let url = URL(string: urlString) {
            imageOriginalUrl = url
        }

        if let width = attributes.imageWidth, let value = Float(width) {
            imageWidth = CGFloat(value)
        }

        if let height = attributes.imageHeight, let value = Float(height) {
            imageHeight = CGFloat(value)
        }
    }

//    init(uid: String, url: String) {
//
//        self.uid = uid
//
//        if let url = URL(string: url) {
//            imageOriginalUrl = url
//        }
//    }

    init(dictionary: [AnyHashable: Any]) {

        if let value = dictionary[Key.imageOriginalUrl.rawValue] as? String, let url = URL(string: value) {
            imageOriginalUrl = url
        }

        if let height = dictionary[Key.imageHeight.rawValue] as? Double {
            imageHeight = CGFloat(height)
        }
        
        if let width = dictionary[Key.imageWidth.rawValue] as? Double {
            imageWidth = CGFloat(width)
        }
    }
}

extension Gif {

    func toDictionary() -> [AnyHashable: Any] {

        return fields(attributes: [
            .imageOriginalUrl: imageOriginalUrl!.absoluteString,
            .imageWidth: Double(imageWidth!),
            .imageHeight: Double(imageHeight!),
        ])
    }

    private func fields(attributes: [Key: Any]) -> [AnyHashable: Any] {
        return Dictionary(uniqueKeysWithValues: attributes.map { key, value in (key.rawValue, value) })
    }
}
