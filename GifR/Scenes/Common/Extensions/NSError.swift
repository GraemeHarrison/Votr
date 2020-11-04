//
//  NSError.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation

extension NSError {

    convenience init(message: String) {
        self.init(domain: "", code: 0, userInfo:  [NSLocalizedDescriptionKey: message])
    }
}
