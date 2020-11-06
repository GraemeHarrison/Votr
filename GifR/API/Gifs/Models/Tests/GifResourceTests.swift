//
//  GifResourceTests.swift
//  GifRTests
//
//  Created by Graeme Harrison on 2020-11-05.
//

import XCTest
import SwiftyJSON

class GifResourceTests: XCTestCase {

    let fileName = "get_gif"
    var gif: Gif!
    var attributes: JSON!

    override func setUp() {

        let fixture = JSONFixture(fileName: fileName)
        attributes = fixture.json["data"]

        let data = JSONFileReader(filename: fileName).toData()!
        let deserializer = GifDeserializer()
        deserializer.data = data
        gif = deserializer.process()!
    }

    func testThatGifUrlIsDeserialized() {
        XCTAssertEqual(gif.imageOriginalUrl?.absoluteString, attributes["image_original_url"].stringValue)
    }

    func testThatGifWidthIsDeserialized() {
        XCTAssertEqual(Double(gif.imageWidth!), attributes["image_width"].doubleValue)
    }

    func testThatGifHeightIsDeserialized() {
        XCTAssertEqual(Double(gif.imageHeight!), attributes["image_height"].doubleValue)
    }
}
