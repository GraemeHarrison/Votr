// OnboardingUseCase.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import Foundation

class OnboardingUseCase {

    class Cache {

        var username: String?
        var email: String?
        var password: String?
    }
    private var cache = Cache()

    private var startMode: OnboardingStartMode!
    weak var presenter: OnboardingUseCaseOutput?

    init() {}

    func setParameters(startMode: OnboardingStartMode) {
        self.startMode = startMode
    }

    func begin() {

        let transformer = OnboardingBeginTransformer()
        transformer.transform(startMode: startMode, presenter: presenter)
    }

    func usernameChanged(_ username: String?) {
        cache.username = username
    }

    func emailChanged(_ email: String?) {
        cache.email = email
    }

    func passwordChanged(_ password: String?) {
        cache.password = password
    }

    func ctaTapped() {

        let transformer = OnboardingAuthTransformer()
        transformer.transform(startMode: startMode, cache: cache, presenter: presenter)
    }
}
