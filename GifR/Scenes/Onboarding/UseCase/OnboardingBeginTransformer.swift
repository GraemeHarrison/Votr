// OnboardingBeginTransformer.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import Foundation

class OnboardingBeginTransformer {

    private var presenter: OnboardingUseCaseOutput?

    init() {}

    func transform(startMode: OnboardingStartMode, presenter: OnboardingUseCaseOutput?) {

        self.presenter = presenter

        presenter?.presentModelListBegin()
        switch startMode {
        case .signUp: presentSignUpUI()
        case .login: presentLoginUI()
        }
        presenter?.presentModelListEnd()
    }

    private func presentSignUpUI() {

        presenter?.presentUsernameInput(nil)
        presenter?.presentEmailInput(nil)
        presenter?.presentPasswordInput(nil)
    }

    private func presentLoginUI() {

        presenter?.presentEmailInput(nil)
        presenter?.presentPasswordInput(nil)
    }
}
