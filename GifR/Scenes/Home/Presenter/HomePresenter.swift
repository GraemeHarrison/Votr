//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit

protocol HomeUseCaseOutput: PresentAlert {

    func presentGif(url: URL?)
    func presentHeader(username: String)
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

    func eventLogoutTapped() {
        useCase.logoutTapped()
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

    func presentHeader(username: String) {
        viewController?.showHeader(text: "Welcome \(username.capitalized)!")
    }
}

extension HomePresenter: HomeRouterOutput {}

extension HomePresenter {

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
