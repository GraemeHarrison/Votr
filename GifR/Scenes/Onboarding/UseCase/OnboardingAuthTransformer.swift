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
            failMessage += "\n* Email"
        }
        if let password = cache.password, password.isValidPassword() {} else {
            failMessage += "\n* Password (min 6 characters)"
        }

        switch startMode {

        case .signUp:

            if let username = cache.username, !username.isEmpty, username.isValidUsername() {} else {
                failMessage = "\n* User name" + failMessage
            }

            guard failMessage.isEmpty else {
                presenter?.presentOkErrorAlert(title: .oops, message: "\nRemaining Requirements:\n" + failMessage)
                return
            }
            handleSignUp()

        case .login:

            guard failMessage.isEmpty else {
                presenter?.presentOkErrorAlert(title: .oops, message: "\nRemaining Requirements:\n" + failMessage)
                return
            }
            handleLogin()
        }
    }

    private func handleSignUp() {

        FirebaseService.shared.signUp(email: cache.email!, password: cache.password!, username: cache.username!) { (success, error) in

            guard success else {
                print(String(describing: error))
                self.presenter?.presentGenericErrorAlert()
                return
            }
            MainViewController.instance.showStoryboard(.home)
        }
    }

    private func handleLogin() {

        FirebaseService.shared.login(email: cache.email!, password: cache.password!) { (success, error) in

            guard success else {
                print(String(describing: error))
                self.presenter?.presentGenericErrorAlert()
                return
            }
            MainViewController.instance.showStoryboard(.home)
        }
    }
}
