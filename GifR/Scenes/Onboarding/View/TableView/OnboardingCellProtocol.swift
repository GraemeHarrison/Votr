// OnboardingCellProtocol.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

protocol OnboardingCellProtocol {

    func show(viewModel: OnboardingViewModel, tableView: UITableView, at indexPath: IndexPath, presenter: OnboardingPresenter) -> OnboardingCellProtocol
}
