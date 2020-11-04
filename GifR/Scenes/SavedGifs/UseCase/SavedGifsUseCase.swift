//
// SavedGifsUseCase.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import Foundation

class SavedGifsUseCase {
    
    weak var presenter: SavedGifsUseCaseOutput?

    func begin() {

        let transformer = SavedGifsBeginTransformer()
        transformer.transform(presenter: presenter)
    }
}
