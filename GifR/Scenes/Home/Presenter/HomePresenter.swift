//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit

protocol HomeUseCaseOutput: PresentAlert {
    func presentGif(url: URL?) 
}

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

    func eventSavedGifsTapped() {
        router.transitionToSavedGifs()
    }

    func eventLikeTapped() {
        useCase.likeTapped()
    }

    func eventRandomGifTapped() {
        useCase.randomGifTapped()
    }
}

extension HomePresenter: HomeUseCaseOutput {

    var vc: (UIViewController & ShowAlert)? {
        return viewController as? UIViewController & ShowAlert
    }

    func presentGif(url: URL?) {
        viewController?.showGif(url: url)
    }
}

extension HomePresenter: HomeRouterOutput {}

extension HomePresenter {

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
