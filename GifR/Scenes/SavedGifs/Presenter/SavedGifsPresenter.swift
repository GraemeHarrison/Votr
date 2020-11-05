//
// SavedGifsPresenter.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
// 

import Foundation
import UIKit

protocol SavedGifsUseCaseOutput: PresentAlert {

    func presentModelListBegin()
    func presentModelListEnd()
    func presentGif(url: URL?, width: CGFloat?, height: CGFloat?)
    func presentShareSheet(gifUrl: URL) 
}

class SavedGifsPresenter {
    
    fileprivate let useCase: SavedGifsUseCase
    fileprivate let router: SavedGifsRouter
    weak var viewController: SavedGifsPresenterOutput?
    fileprivate var viewModels: [SavedGifsViewModel] = []
    
    init(router: SavedGifsRouter, useCase: SavedGifsUseCase) {
        
        self.useCase = useCase
        self.router = router
    }
    
    func eventViewReady() {
        useCase.begin()
    }

    func eventShareGifTapped(url: URL) {
        useCase.shareGifTapped(url: url)
    }
}

extension SavedGifsPresenter: SavedGifsUseCaseOutput {

    var vc: (UIViewController & ShowAlert)? {
        return viewController as? UIViewController & ShowAlert
    }

    func presentModelListBegin() {
        viewModels = []
    }

    func presentModelListEnd() {
        viewController?.showModels()
    }

    func presentGif(url: URL?, width: CGFloat?, height: CGFloat?) {
        viewModels.append(.gif(url: url, width: width, height: height))
    }

    func presentShareSheet(gifUrl: URL) {
        viewController?.showShareSheet(subject: "You gotta see this...", body: "Check out this awesome gif!", gifUrl: gifUrl)
    }
}

extension SavedGifsPresenter: SavedGifsRouterOutput {}

extension SavedGifsPresenter {

    var viewModelCount: Int {
        return viewModels.count
    }

    func viewModel(at index: Int) -> SavedGifsViewModel {
        return viewModels[index]
    }

    func cellId(at index: Int) -> String {
        return viewModels[index].cellId
    }
}

extension SavedGifsPresenter {

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
