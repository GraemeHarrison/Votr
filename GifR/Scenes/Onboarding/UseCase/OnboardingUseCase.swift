// OnboardingUseCase.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import Foundation

class OnboardingUseCase {
    
    weak var presenter: OnboardingUseCaseOutput?

    init() {}

    func begin() {

        let transformer = OnboardingBeginTransformer()
        transformer.transform(presenter: presenter)
    }
}
