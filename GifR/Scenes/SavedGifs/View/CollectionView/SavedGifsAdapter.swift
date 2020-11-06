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

extension SavedGifsAdapter: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let length = collectionView.bounds.size.width
        return CGSize(width: length, height: length)
    }
}

extension SavedGifsAdapter: CustomCollectionViewLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, heightForGifAtIndexPath indexPath: IndexPath) -> CGFloat {

        guard case .gif(_, _, let width, let height) = presenter.viewModel(at: indexPath.item),
              let h = height,
              let w = width else {
            return 50
        }

        let columnWidth = collectionView.bounds.width/2
        let ratio = columnWidth/w
        return h * ratio
    }
}
