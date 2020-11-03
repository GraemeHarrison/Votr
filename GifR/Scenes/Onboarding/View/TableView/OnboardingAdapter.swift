// OnboardingAdapter.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

class OnboardingAdapter: NSObject {
    
    var presenter: OnboardingPresenter!
    let cellConfigurator: OnboardingCellConfigurator
    
    init(cellConfigurator: OnboardingCellConfigurator = OnboardingCellConfigurator() ) {
        self.cellConfigurator = cellConfigurator
    }
}

extension OnboardingAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModelCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return cellConfigurator
            .set(tableView: tableView, indexPath: indexPath, presenter: presenter)
            .show(viewModel: presenter.viewModel(at: indexPath.row))
    }
}

extension OnboardingAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
