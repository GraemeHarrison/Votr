// OnboardingPresenter.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import Foundation
import UIKit

protocol OnboardingUseCaseOutput: class {

    func presentModelListBegin()
    func presentModelListEnd()
}

class OnboardingPresenter {
    
    fileprivate let useCase: OnboardingUseCase
    fileprivate let router: OnboardingRouter
    weak var viewController: OnboardingPresenterOutput?
    fileprivate var viewModels: [OnboardingViewModel] = []
    
    init(router: OnboardingRouter, useCase: OnboardingUseCase) {
        
        self.useCase = useCase
        self.router = router
    }
    
    func eventViewReady() {
        useCase.begin()
    }
}

extension OnboardingPresenter: OnboardingUseCaseOutput {

    func presentModelListBegin() {
        viewModels = []
    }

    func presentModelListEnd() {
        viewController?.showModels()
    }
}

extension OnboardingPresenter: OnboardingRouterOutput {}

extension OnboardingPresenter {

    var viewModelCount: Int {
        return viewModels.count
    }

    func viewModel(at index: Int) -> OnboardingViewModel {
        return viewModels[index]
    }

    func cellId(at index: Int) -> String {
        return viewModels[index].cellId
    }
}

extension OnboardingPresenter {

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
