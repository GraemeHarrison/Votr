//
//  FirebaseService.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

extension DatabaseReference {

    func child(_ childPath: FirebaseService.ChildPath) -> DatabaseReference {
        return child(childPath.rawValue)
    }
}

class FirebaseService {

    enum ChildPath: String {
        case users
    }

    typealias Result = (Bool, Error?) -> ()

    static let shared = FirebaseService()

    var currentUser: User?
    private var ref: DatabaseReference! { return Database.database().reference() }

    private init() {}

    func login(email: String, password: String, completion: @escaping Result) {

        Auth.auth().signIn(withEmail: email, password: password, completion: { (result, error) in

            guard let result = result else {
                completion(false, error)
                return
            }

            self.currentUser = User(firUser: result.user)
            completion(true, error)
        })
    }

    func signUp(email: String, password: String, completion: @escaping Result) {

        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in

            guard let result = result else {
                completion(false, error)
                return
            }

            let user = User(firUser: result.user)
            self.saveUser(user: user, completion: completion)
        }
    }

    func saveUser(user: User, completion: @escaping Result) {

        ref.child(.users).child(user.uid).setValue(user.toDictionary()) { (error, databaseRef) in

            if error == nil {
                self.currentUser = user
            }
            completion(error == nil, error)
        }
    }
}
