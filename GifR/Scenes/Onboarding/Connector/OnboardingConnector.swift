// OnboardingConnector.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

class OnboardingConnector {

    private let viewController: OnboardingViewController
    private let adapter: OnboardingAdapter
    private let useCase: OnboardingUseCase
    private let presenter: OnboardingPresenter
    private let router: OnboardingRouter

    init(viewController: OnboardingViewController, adapter: OnboardingAdapter, router: OnboardingRouter, useCase: OnboardingUseCase, presenter: OnboardingPresenter) {

        self.viewController = viewController
        self.adapter = adapter
        self.useCase = useCase
        self.presenter = presenter
        self.router = router
    }

    convenience init(viewController: OnboardingViewController, adapter: OnboardingAdapter) {

        let useCase = OnboardingUseCase()
        let router = OnboardingRouter(navigationSource: viewController)
        let presenter = OnboardingPresenter(router: router, useCase: useCase)

        self.init(viewController: viewController, adapter: adapter, router: router, useCase: useCase, presenter: presenter)
    }

    func configure() {
        viewController.presenter = presenter
        adapter.presenter = presenter
        useCase.presenter = presenter
        presenter.viewController = viewController
        router.presenter = presenter
    }
}
