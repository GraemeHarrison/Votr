//
//  HomeLikeGifTransformer.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation

class HomeLikeGifTransformer {

    func transform(cache: HomeUseCase.Cache, presenter: HomeUseCaseOutput?) {

        guard let gif = cache.currentGif else {
            presenter?.presentGenericErrorAlert()
            return
        }

        GifService.shared.likeGif(gif) { (success, error) in

            if success {

            }
            else {
                presenter?.presentGenericErrorAlert()
            }
        }
    }
}
