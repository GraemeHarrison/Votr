//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit

class HomeConnector {

    private let viewController: HomeViewController
    private let useCase: HomeUseCase
    private let presenter: HomePresenter
    private let router: HomeRouter

    init(viewController: HomeViewController, router: HomeRouter, useCase: HomeUseCase, presenter: HomePresenter) {

        self.viewController = viewController
        self.useCase = useCase
        self.presenter = presenter
        self.router = router
    }

    convenience init(viewController: HomeViewController) {

        let useCase = HomeUseCase()
        let router = HomeRouter(navigationSource: viewController)
        let presenter = HomePresenter(router: router, useCase: useCase)

        self.init(viewController: viewController, router: router, useCase: useCase, presenter: presenter)
    }

    func configure() {
        viewController.presenter = presenter
        useCase.presenter = presenter
        presenter.viewController = viewController
        router.presenter = presenter
    }
}
