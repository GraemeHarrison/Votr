// OnboardingViewController.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

enum OnboardingStartMode {

    case signUp
    case login
}

protocol OnboardingViewControllerDelegate: class {}

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
    private(set) weak var delegate: OnboardingViewControllerDelegate?

    func setParameters(startMode: OnboardingStartMode, delegate: OnboardingViewControllerDelegate?) {

        self.delegate = delegate
        presenter.setParameters(startMode: startMode)
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
