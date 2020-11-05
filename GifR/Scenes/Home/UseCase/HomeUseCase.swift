//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation

class HomeUseCase {

    class Cache {
        var currentGif: Gif?
    }
    private var cache = Cache()
    weak var presenter: HomeUseCaseOutput?
    
    init() {}

    func begin() {

        let transformer = HomeBeginTransformer()
        transformer.transform(cache: cache, presenter: presenter)
    }

    func randomGifTapped() {
        begin()
    }

    func likeTapped() {

        let transformer = HomeLikeGifTransformer()
        transformer.transform(cache: cache, presenter: presenter)
    }

    func logoutTapped() {

        let transformer = HomeLogoutTransformer()
        transformer.transform(presenter: presenter)
    }
}
