//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation

class HomeBeginTransformer {

    func transform(cache: HomeUseCase.Cache, presenter: HomeUseCaseOutput?) {

        GifClient.fetchRandomGif { (result) in

            switch result {

            case .success(let gif):

                print("***** Success fetching gif with url: \(String(describing: gif?.imageOriginalUrl?.absoluteString))")
                cache.currentGif = gif
                presenter?.presentGif(url: gif?.imageOriginalUrl)

            case .failure(let error):

                print("***** Failure fetching gif: \(error)")
                presenter?.presentOkErrorAlert(title: .oops, message: "There was an error fetching your gif. Maybe try another one?")
            }
        }
    }
}
