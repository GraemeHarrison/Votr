// OnboardingUseCase.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import Foundation

class OnboardingUseCase {

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
}
