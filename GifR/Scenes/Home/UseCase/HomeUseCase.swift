//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation

class HomeUseCase {
    
    weak var presenter: HomeUseCaseOutput?
    
    init() {}

    func begin() {

        let transformer = HomeBeginTransformer()
        transformer.transform(presenter: presenter)
    }
}
