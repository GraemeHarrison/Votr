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

protocol OnboardingPresenterOutput: ShowAlert {

    func showModels()
    func showEndEditing()
    func showTitle(_ title: String) 
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
    fileprivate var keyboardOffset: CGFloat = 0

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
        configureTableView()
        presenter.eventViewReady()
    }

    private func configureTableView() {
        tableView.registerCells([OnboardingTextFieldCell.self,
                                 OnboardingCTACell.self])
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension OnboardingViewController: OnboardingPresenterOutput {

    func showModels() {
        tableView.reloadData()
    }

    func showEndEditing() {
        view.endEditing(true)
    }

    func showTitle(_ title: String) {
        self.title = title
    }
}
