// OnboardingRouter.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

protocol OnboardingNavigationSource: class  {

    var navigationController: UINavigationController?  { get }
    func performSegue(withIdentifier identifier: String, sender: Any?)
}

protocol OnboardingRouterOutput: class {}

class OnboardingRouter {

    enum Segue: String {
        case showNext
    }

    weak var presenter: OnboardingRouterOutput!
    private(set) unowned var navigationSource: OnboardingNavigationSource

    init(navigationSource: OnboardingNavigationSource) {
        self.navigationSource = navigationSource
    }
    
    func transitionToNext(index: Int) {
        performSegue(.showNext, sender: index)
    }

    private func performSegue(_ segue: Segue, sender: Any?) {
        navigationSource.performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch Segue(rawValue: segue.identifier!)! {

        case .showNext:
            break
        }
    }
}

extension OnboardingViewController: OnboardingNavigationSource {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.prepare(for: segue, sender: sender)
    }
}
