//
//  User.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation
import Firebase

class User {

    enum Key: String {
        case uid
    }

    var uid: String!

    init(firUser: FirebaseAuth.User) {
        self.uid = firUser.uid
    }
}

extension User {

    func toDictionary() -> [AnyHashable: Any] {
        return fields(attributes: [.uid: uid!])
    }

    private func fields(attributes: [Key: Any]) -> [AnyHashable: Any] {
        return Dictionary(uniqueKeysWithValues: attributes.map { key, value in (key.rawValue, value) })
    }
}
