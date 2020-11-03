// OnboardingCellConfigurator.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

class OnboardingCellConfigurator {

    var tableView: UITableView!
    var indexPath: IndexPath!
    var presenter: OnboardingPresenter!

    func set(tableView: UITableView, indexPath: IndexPath, presenter: OnboardingPresenter) -> Self {
        
        self.tableView = tableView
        self.indexPath = indexPath
        self.presenter = presenter
        return self
    }
    
    func show(viewModel: OnboardingViewModel) -> UITableViewCell {
        return tableCell().show(viewModel: viewModel, tableView: tableView, at: indexPath, presenter: presenter) as! UITableViewCell
    }
    
    func tableCell() -> OnboardingCellProtocol {
        return tableView!.dequeueReusableCell(withIdentifier: presenter.cellId(at: indexPath.item)) as! OnboardingCellProtocol
    }
}
