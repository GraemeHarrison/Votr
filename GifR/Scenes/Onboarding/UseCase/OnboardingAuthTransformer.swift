//
//  OnboardingAuthTransformer.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation
import FirebaseAuth

class OnboardingAuthTransformer {

    private var cache: OnboardingUseCase.Cache!
    private var presenter: OnboardingUseCaseOutput?

    init() {}

    func transform(startMode: OnboardingStartMode, cache: OnboardingUseCase.Cache, presenter: OnboardingUseCaseOutput?) {

        self.cache = cache
        self.presenter = presenter

        switch startMode {
        case .signUp: break
        case .login: break
        }
    }

    private func handleSignUp() {

        Auth.auth().createUser(withEmail: cache.email!, password: cache.password!) { (authDataResult, error) in

            if let authDataResult = authDataResult {


            }
            else if let error = error {

            }
        }
    }

    private func handleLogin() {

        Auth.auth().signIn(withEmail: cache.email!, password: cache.password!, completion: { (firebaseUser, error) in

            if let firebaseUser = firebaseUser {


            }
            else if let error = error {

            }
        })
    }
}
