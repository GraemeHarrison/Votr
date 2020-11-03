// OnboardingTextFieldCell.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

class OnboardingTextFieldCell: UITableViewCell, OnboardingCellProtocol {

    @IBOutlet var textField: UITextField!
    
    fileprivate weak var presenter: OnboardingPresenter!
    fileprivate weak var tableView: UITableView!
    fileprivate var indexPath: IndexPath!

    func show(viewModel: OnboardingViewModel, tableView: UITableView, at indexPath: IndexPath, presenter: OnboardingPresenter) -> OnboardingCellProtocol {

        guard case .usernameInput(let text, let placeholder) = viewModel else { fatalError() }

        self.presenter = presenter
        self.tableView = tableView
        self.indexPath = indexPath

        textField.placeholder = placeholder
        textField.text = text

        return self
    }
}
