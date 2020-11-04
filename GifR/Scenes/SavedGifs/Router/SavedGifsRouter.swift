//
// SavedGifsRouter.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import UIKit

protocol SavedGifsNavigationSource: class  {

    var navigationController: UINavigationController?  { get }
    func performSegue(withIdentifier identifier: String, sender: Any?)
}

protocol SavedGifsRouterOutput: class {}

class SavedGifsRouter {

    enum Segue: String {
        case temp
    }

    weak var presenter: SavedGifsRouterOutput!
    private(set) unowned var navigationSource: SavedGifsNavigationSource

    init(navigationSource: SavedGifsNavigationSource) {
        self.navigationSource = navigationSource
    }

    private func performSegue(_ segue: Segue, sender: Any?) {
        navigationSource.performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch Segue(rawValue: segue.identifier!)! {
        case .temp: break
        }
    }
}

extension SavedGifsViewController: SavedGifsNavigationSource {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.prepare(for: segue, sender: sender)
    }
}
