// OnboardingViewController.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

@objc protocol OnboardingViewControllerDelegate {
}

protocol OnboardingPresenterOutput: class {
    func showModels()
}

class OnboardingViewController: UIViewController {

    @IBOutlet private(set) weak var tableView: UITableView! {
        didSet {
            tableView.delegate = adapter
            tableView.dataSource = adapter
        }
    }

    fileprivate var adapter = OnboardingAdapter()
    var presenter: OnboardingPresenter!
    private(set) var delegate: OnboardingViewControllerDelegate?

    func setParameters(delegate: OnboardingViewControllerDelegate) {
        self.delegate = delegate
    }

    override func awakeFromNib() {

        super.awakeFromNib()
        OnboardingConnector(viewController: self, adapter: adapter).configure()
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        presenter.eventViewReady()
    }
}

extension OnboardingViewController: OnboardingPresenterOutput {

    func showModels() {
        tableView.reloadData()
    }
}
