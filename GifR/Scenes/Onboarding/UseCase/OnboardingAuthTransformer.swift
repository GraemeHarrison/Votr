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

        var failMessage = ""

        if let email = cache.email, !email.isEmpty, email.isValidEmail() {} else {
            failMessage += "* Email\n"
        }
        if let password = cache.password, password.isValidPassword() {} else {
            failMessage += "* Password (min 6 characters)"
        }

        switch startMode {

        case .signUp:

            if let username = cache.username, !username.isEmpty, username.isValidUsername() {} else {
                failMessage = "* User name\n" + failMessage
            }

            guard failMessage.isEmpty else {
                print("Remaining Requirements" + failMessage)
                return
            }
            handleSignUp()

        case .login:

            guard failMessage.isEmpty else {
                print("Remaining Requirements" + failMessage)
                return
            }
            handleLogin()
        }
    }

    private func handleSignUp() {

        FirebaseService.shared.signUp(email: cache.email!, password: cache.password!) { (success, error) in

            guard success else {
                print(error)
                return
            }
        }
    }

    private func handleLogin() {

        FirebaseService.shared.login(email: cache.email!, password: cache.password!) { (success, error) in

            guard success else {
                print(error)
                return
            }
        }
    }
}
