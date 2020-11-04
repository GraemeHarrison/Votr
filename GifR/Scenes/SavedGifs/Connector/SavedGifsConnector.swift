//
// SavedGifsConnector.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import UIKit

class SavedGifsConnector {

    private let viewController: SavedGifsViewController
    private let adapter: SavedGifsAdapter
    private let useCase: SavedGifsUseCase
    private let presenter: SavedGifsPresenter
    private let router: SavedGifsRouter

    init(viewController: SavedGifsViewController, adapter: SavedGifsAdapter, router: SavedGifsRouter, useCase: SavedGifsUseCase, presenter: SavedGifsPresenter) {

        self.viewController = viewController
        self.adapter = adapter
        self.useCase = useCase
        self.presenter = presenter
        self.router = router
    }

    convenience init(viewController: SavedGifsViewController, adapter: SavedGifsAdapter) {

        let useCase = SavedGifsUseCase()
        let router = SavedGifsRouter(navigationSource: viewController)
        let presenter = SavedGifsPresenter(router: router, useCase: useCase)

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
