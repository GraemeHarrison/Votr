//
//  FirebaseService.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class FirebaseService {

    enum ChildPath: String {
        case users
        case gifs
    }

    typealias SuccessResult = (Bool, Error?) -> Void

    internal var ref: DatabaseReference! { return Database.database().reference() }

    internal init() {}
}

extension DatabaseReference {

    func child(_ childPath: FirebaseService.ChildPath) -> DatabaseReference {
        return child(childPath.rawValue)
    }
}
