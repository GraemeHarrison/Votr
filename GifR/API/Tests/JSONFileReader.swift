//
//  JSONFileReader.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-05.
//

import Foundation
import SwiftyJSON

class JSONFileReader {
    let filename: String

    init(filename: String) {
        self.filename = filename
    }

    func toJson() -> JSON {
        let fileData = toData()
        return try! JSON(data: fileData!)
    }

    func toData() -> Data? {
        let fileData = contents(path: resourcePath(filename: self.filename))
        return fileData
    }

    private func contents(path: String) -> Data? {
        return try! String(contentsOfFile: path).data(using: String.Encoding.utf8, allowLossyConversion: false)
    }

    private func resourcePath(filename: String) -> String {
        return Bundle(for: JSONFileReader.self).path(forResource: filename, ofType: "json")!
    }
}

