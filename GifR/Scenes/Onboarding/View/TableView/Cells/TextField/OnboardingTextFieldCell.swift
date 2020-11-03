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
    private var viewModel: OnboardingViewModel!

    func show(viewModel: OnboardingViewModel, tableView: UITableView, at indexPath: IndexPath, presenter: OnboardingPresenter) -> OnboardingCellProtocol {

        switch viewModel {

        case .usernameInput(let text, let placeholder):
            configure(text: text, placeholder: placeholder, keyboardType: .default, isSecure: false)

        case .emailInput(let text, let placeholder):
            configure(text: text, placeholder: placeholder, keyboardType: .emailAddress, isSecure: false)

        case .passwordInput(let text, let placeholder):
            configure(text: text, placeholder: placeholder, keyboardType: .default, isSecure: true)

        default: fatalError()
        }

        self.viewModel = viewModel
        self.presenter = presenter
        self.tableView = tableView
        self.indexPath = indexPath
        return self
    }

    private func configure(text: String?, placeholder: String, keyboardType: UIKeyboardType, isSecure: Bool) {

        textField.text = text
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = isSecure
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {

        switch viewModel {
        case .usernameInput: presenter.eventUsernameChanged(textField.text)
        case .emailInput: presenter.eventEmailChanged(textField.text)
        case .passwordInput: presenter.eventPasswordChanged(textField.text)
        default: break
        }
    }
}
