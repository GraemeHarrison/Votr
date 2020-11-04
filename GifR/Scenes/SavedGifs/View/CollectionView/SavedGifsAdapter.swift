//
// SavedGifsAdapter.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import UIKit

class SavedGifsAdapter: NSObject {
    
    var presenter: SavedGifsPresenter!
    let cellConfigurator: SavedGifsCellConfigurator
    
    init(cellConfigurator: SavedGifsCellConfigurator = SavedGifsCellConfigurator() ) {
        self.cellConfigurator = cellConfigurator
    }
}

extension SavedGifsAdapter: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.viewModelCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return cellConfigurator
            .set(collectionView: collectionView, indexPath: indexPath, presenter: presenter)
            .show(viewModel: presenter.viewModel(at: indexPath.row))
    }
}

extension SavedGifsAdapter: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension SavedGifsAdapter: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: presenter.cellWidth(at: indexPath.item), height: presenter.cellHeight(at: indexPath.item))
    }
}
