//
// SavedGifsBeginTransformer.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import Foundation

class SavedGifsBeginTransformer {

    func transform(presenter: SavedGifsUseCaseOutput?) {

        GifService.shared.fetchLikedGifs { (result) in

            switch result {

            case .success(let gifs):

                presenter?.presentModelListBegin()
                gifs.reversed().forEach { presenter?.presentGif(url: $0.fixedWidthSmallUrl, width: $0.imageWidth, height: $0.imageHeight) }
                presenter?.presentModelListEnd()

            case .failure(let error):

                print("Error fetching liked gifs: \(error)")
                presenter?.presentGenericErrorAlert()
            }
        }
    }
}
