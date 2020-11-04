//
// SavedGifsCellConfigurator.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
// 

import UIKit

class SavedGifsCellConfigurator {

    var collectionView: UICollectionView!
    var indexPath: IndexPath!
    var presenter: SavedGifsPresenter!

    func set(collectionView: UICollectionView, indexPath: IndexPath, presenter: SavedGifsPresenter) -> Self {
        
        self.collectionView = collectionView
        self.indexPath = indexPath
        self.presenter = presenter
        return self
    }
    
    func show(viewModel: SavedGifsViewModel) -> UICollectionViewCell {
        return collectionCell().show(viewModel: viewModel, collectionView: collectionView, at: indexPath, presenter: presenter) as! UICollectionViewCell
    }
    
    func collectionCell() -> SavedGifsCellProtocol {
        return collectionView!.dequeueReusableCell(withReuseIdentifier: presenter.cellId(at: indexPath.item), for: indexPath!) as! SavedGifsCellProtocol
    }
}
