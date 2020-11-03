//
//  OnboardingCTACell.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit

class OnboardingCTACell: UITableViewCell, OnboardingCellProtocol {

    @IBOutlet var button: UIButton!

    fileprivate weak var presenter: OnboardingPresenter!
    fileprivate weak var tableView: UITableView!
    fileprivate var indexPath: IndexPath!

    func show(viewModel: OnboardingViewModel, tableView: UITableView, at indexPath: IndexPath, presenter: OnboardingPresenter) -> OnboardingCellProtocol {

        guard case .cta(let title) = viewModel else { fatalError() }

        button.setTitle(title, for: .normal)
        self.presenter = presenter
        self.tableView = tableView
        self.indexPath = indexPath
        return self
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        presenter?.eventCTATapped()
    }
}
