//
//  User.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation

class User {

    enum Key: String {
        case uid
        case username
    }

    var uid: String!
    var username: String!

    init(uid: String, username: String) {

        self.uid = uid
        self.username = username
    }

    init(dictionary: [AnyHashable: Any]) {

        uid = dictionary[Key.uid] as? String
        username = dictionary[Key.username] as? String
    }
}

extension User {

    func toDictionary() -> [AnyHashable: Any] {

        return fields(attributes: [
            .uid: uid!,
            .username: username!
        ])
    }

    private func fields(attributes: [Key: Any]) -> [AnyHashable: Any] {
        return Dictionary(uniqueKeysWithValues: attributes.map { key, value in (key.rawValue, value) })
    }
}
