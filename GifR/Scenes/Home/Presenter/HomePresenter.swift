//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit

protocol HomeUseCaseOutput: class {}

class HomePresenter {
    
    fileprivate let useCase: HomeUseCase
    fileprivate let router: HomeRouter
    weak var viewController: HomePresenterOutput?

    init(router: HomeRouter, useCase: HomeUseCase) {
        
        self.useCase = useCase
        self.router = router
    }
    
    func eventViewReady() {
        useCase.begin()
    }
}

extension HomePresenter: HomeUseCaseOutput {}

extension HomePresenter: HomeRouterOutput {}

extension HomePresenter {

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
