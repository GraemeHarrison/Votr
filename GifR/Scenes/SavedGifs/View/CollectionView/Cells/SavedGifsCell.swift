//
// SavedGifsCell.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import UIKit

class SavedGifsCell: UICollectionViewCell, SavedGifsCellProtocol {

    fileprivate weak var presenter: SavedGifsPresenter!
    fileprivate weak var collectionView: UICollectionView!
    fileprivate var indexPath: IndexPath!

    func show(viewModel: SavedGifsViewModel, collectionView: UICollectionView, at indexPath: IndexPath, presenter: SavedGifsPresenter) -> SavedGifsCellProtocol {

        self.presenter = presenter
        self.collectionView = collectionView
        self.indexPath = indexPath
        
        return self
    }
}
