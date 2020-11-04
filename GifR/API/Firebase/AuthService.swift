//
//  AuthService.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class AuthService: FirebaseService {

    var currentUser: User?
    static let shared = AuthService()

    func observeAuthState(loggedIn: @escaping (Bool) -> Void) {

        Auth.auth().addStateDidChangeListener { (auth, authenticatedUser) in

            if let user = authenticatedUser {

                self.fetchUser(uid: user.uid) { (success, error) in
                    loggedIn(success)
                }
            }
            else {
                loggedIn(false)
            }
        }
    }

    func login(email: String, password: String, completion: @escaping SuccessResult) {

        Auth.auth().signIn(withEmail: email, password: password, completion: { (result, error) in

            guard let result = result else {
                completion(false, error)
                return
            }
            self.fetchUser(uid: result.user.uid, completion: completion)
        })
    }

    func signUp(email: String, password: String, username: String, completion: @escaping SuccessResult) {

        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in

            guard let result = result else {
                completion(false, error)
                return
            }

            let user = User(uid: result.user.uid, username: username)
            self.saveUser(user: user, completion: completion)
        }
    }

    private func saveUser(user: User, completion: @escaping SuccessResult) {

        ref.child(.users).child(user.uid).setValue(user.toDictionary()) { (error, databaseRef) in

            if error == nil {
                self.currentUser = user
            }
            completion(error == nil, error)
        }
    }

    private func fetchUser(uid: String, completion: @escaping SuccessResult) {

        ref.child(.users).child(uid).observeSingleEvent(of: .value, with: { (snapshot) in

            guard let userDict = snapshot.value as? [AnyHashable: Any] else {
                completion(false, nil)
                return
            }
            self.currentUser = User(dictionary: userDict)
            print("***** current user: \(self.currentUser!.username!)")
            completion(true, nil)

        }) { (error) in
            completion(false, error)
        }
    }
}
