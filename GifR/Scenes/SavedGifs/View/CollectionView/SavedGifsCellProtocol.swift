//
// SavedGifsCellProtocol.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import UIKit

protocol SavedGifsCellProtocol {

    func show(viewModel: SavedGifsViewModel, collectionView: UICollectionView, at indexPath: IndexPath, presenter: SavedGifsPresenter) -> SavedGifsCellProtocol
}

extension SavedGifsCellProtocol where Self: UICollectionViewCell {

    func willDisplay(collectionView: UICollectionView, indexPath: IndexPath) {}

    func findCellIndex() -> Int {

        let collectionView = self.superview as! UICollectionView
        let indexPath = collectionView.indexPath(for: self)
        return indexPath!.item
    }
}
