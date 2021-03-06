//
// SavedGifsCell.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import UIKit
import SDWebImage

class SavedGifsCell: UICollectionViewCell, SavedGifsCellProtocol {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var shareButton: UIButton!

    fileprivate weak var presenter: SavedGifsPresenter!
    fileprivate weak var collectionView: UICollectionView!
    fileprivate var indexPath: IndexPath!
    private var gifUrl: URL?

    func show(viewModel: SavedGifsViewModel, collectionView: UICollectionView, at indexPath: IndexPath, presenter: SavedGifsPresenter) -> SavedGifsCellProtocol {

        guard case .gif(let originalUrl, let downsampledUrl, _, _) = viewModel else { fatalError() }

        self.presenter = presenter
        self.collectionView = collectionView
        self.indexPath = indexPath
        self.gifUrl = originalUrl
        shareButton.isEnabled = gifUrl != nil
        imageView.sd_setImage(with: downsampledUrl)
        return self
    }

    override func prepareForReuse() {

        super.prepareForReuse()
        imageView.sd_cancelCurrentImageLoad()
        imageView.image = nil
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        presenter?.eventShareGifTapped(url: gifUrl!)
    }
}
