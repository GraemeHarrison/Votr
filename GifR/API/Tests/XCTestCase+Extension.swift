//
//  XCTestCase+Extension.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-05.
//

import XCTest
import SwiftyJSON

extension XCTestCase {

    func JSONFixture(fileName: String) -> (data: Data, json: JSON) {

        let path = Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json")!
        let data = try! Data(contentsOf: path)
        let json = JSON(data)
        return (data: data, json: json)
    }
}
