//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation

class HomeBeginTransformer {

    init() {}

    func transform(presenter: HomeUseCaseOutput?)  {

        GifClient.fetchRandomGif { (result) in

            switch result {

            case .success(let gif):
                print("***** Success fetching gif with url: \(gif?.url?.absoluteString)")
                presenter?.presentGif(url: gif?.imageOriginalUrl)

            case .failure(let error):
                print("***** Failure fetching gif: \(error)")
                presenter?.presentOkErrorAlert(title: .oops, message: "There was an error fetching your gif. Maybe try another one?")
            }
        }
    }
}
