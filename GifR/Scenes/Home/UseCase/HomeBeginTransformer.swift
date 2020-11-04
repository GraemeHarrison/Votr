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
                print("***** Success fetching gif with url: \(gif?.url)")
                break

            case .failure(let error):
                print("***** Failure fetching gif: \(error)")
                break
            }
        }
    }
}
