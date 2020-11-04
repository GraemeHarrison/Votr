//
// SavedGifsPresenter.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
// 

import Foundation
import UIKit

protocol SavedGifsUseCaseOutput: class {

    func presentModelListBegin()
    func presentModelListEnd()
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
}

extension SavedGifsPresenter: SavedGifsUseCaseOutput {

    func presentModelListBegin() {
        viewModels = []
    }

    func presentModelListEnd() {
        viewController?.showModels()
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
