//
//  MainViewController.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit

class MainViewController: UIViewController {

    enum Storyboard: String {

        case intro
        case home
    }

    static var instance: MainViewController {

        let appDelegate = UIApplication.shared.delegate!
        let window = appDelegate.window!
        return window!.rootViewController as! MainViewController
    }

    private(set) var currentViewController: UIViewController?

    override func viewDidLoad() {

        super.viewDidLoad()
        showInitialController(storyboard: .intro)
    }

    private func showInitialController(storyboard: Storyboard) {

        let storyboard = UIStoryboard(name: storyboard.rawValue.capitalized, bundle: nil)
        currentViewController = storyboard.instantiateInitialViewController()!
        showViewController(currentViewController!)
    }

    func showStoryboard(_ storyboard: Storyboard, storyParameters: Any? = nil) {

        if let vc = currentViewController {
            hideViewController(vc)
        }
        showInitialController(storyboard: storyboard)
    }

    private func showViewController(_ viewController: UIViewController) {

        addChild(viewController)
        view.addSubview(viewController.view)
        configure(subView: viewController.view, into: view)
        viewController.didMove(toParent: self)
    }

    private func hideViewController(_ viewController: UIViewController) {

        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }

    private func configure(subView: UIView, into mainView: UIView) {

        subView.translatesAutoresizingMaskIntoConstraints = false

        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        mainView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|", options: [], metrics: nil, views: viewBindingsDict))
        mainView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|", options: [], metrics: nil, views: viewBindingsDict))
    }
}
