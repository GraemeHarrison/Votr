//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit

protocol HomeNavigationSource: class  {

    var navigationController: UINavigationController?  { get }
    func performSegue(withIdentifier identifier: String, sender: Any?)
}

protocol HomeRouterOutput: class {}

class HomeRouter {

    enum Segue: String {
        case temp
    }

    weak var presenter: HomeRouterOutput!
    private(set) unowned var navigationSource: HomeNavigationSource

    init(navigationSource: HomeNavigationSource) {
        self.navigationSource = navigationSource
    }

    private func performSegue(_ segue: Segue, sender: Any?) {
        navigationSource.performSegue(withIdentifier: segue.rawValue, sender: index)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch Segue(rawValue: segue.identifier!)! {

        case .temp: break
        }
    }
}

extension HomeViewController: HomeNavigationSource {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.prepare(for: segue, sender: sender)
    }
}
