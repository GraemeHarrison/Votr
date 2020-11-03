// OnboardingCell.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

class OnboardingCell: UITableViewCell, OnboardingCellProtocol {

    fileprivate weak var presenter: OnboardingPresenter!
    fileprivate weak var tableView: UITableView!
    fileprivate var indexPath: IndexPath!

    func show(viewModel: OnboardingViewModel, tableView: UITableView, at indexPath: IndexPath, presenter: OnboardingPresenter) -> OnboardingCellProtocol {

        self.presenter = presenter
        self.tableView = tableView
        self.indexPath = indexPath
        
        return self
    }
}
