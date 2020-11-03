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
    func presentUsernameInput(_ name: String?)
    func presentEmailInput(_ email: String?)
    func presentPasswordInput(_ password: String?)
    func presentCTA(title: String) 
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

    func setParameters(startMode: OnboardingStartMode) {
        useCase.setParameters(startMode: startMode)
    }
    
    func eventViewReady() {
        useCase.begin()
    }

    func eventUsernameChanged(_ username: String?) {
        useCase.usernameChanged(username)
    }

    func eventEmailChanged(_ email: String?) {
        useCase.emailChanged(email)
    }

    func eventPasswordChanged(_ password: String?) {
        useCase.passwordChanged(password)
    }

    func eventCTATapped() {
        useCase.ctaTapped()
    }
}

extension OnboardingPresenter: OnboardingUseCaseOutput {

    func presentModelListBegin() {
        viewModels = []
    }

    func presentModelListEnd() {
        viewController?.showModels()
    }

    func presentUsernameInput(_ name: String?) {
        viewModels.append(.usernameInput(text: name, placeholder: "First Name"))
    }

    func presentEmailInput(_ email: String?) {
        viewModels.append(.emailInput(text: email, placeholder: "Email"))
    }

    func presentPasswordInput(_ password: String?) {
        viewModels.append(.passwordInput(text: password, placeholder: "Password"))
    }

    func presentCTA(title: String) {
        viewModels.append(.cta(title: title))
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
