//
// SavedGifsViewController.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import UIKit

@objc protocol SavedGifsViewControllerDelegate {}

protocol SavedGifsPresenterOutput: ShowAlert {
    func showModels()
}

class SavedGifsViewController: UIViewController {

    @IBOutlet private(set) weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = adapter
            collectionView.dataSource = adapter
        }
    }

    fileprivate var adapter = SavedGifsAdapter()
    var presenter: SavedGifsPresenter!
    private(set) var delegate: SavedGifsViewControllerDelegate?

    func setParameters(delegate: SavedGifsViewControllerDelegate) {
        self.delegate = delegate
    }

    override func awakeFromNib() {

        super.awakeFromNib()
        SavedGifsConnector(viewController: self, adapter: adapter).configure()
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        configureCollectionView()
        presenter.eventViewReady()
    }

    private func configureCollectionView() {
        collectionView.registerCells([SavedGifsCell.self])
    }
}

extension SavedGifsViewController: SavedGifsPresenterOutput {

    func showModels() {
        collectionView.reloadData()
    }
}
