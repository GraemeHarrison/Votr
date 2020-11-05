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
    func showShareSheet(subject: String, body: String, gifUrl: URL) 
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
        let customLayout = CustomCollectionViewLayout()
        customLayout.delegate = adapter
        collectionView.collectionViewLayout = customLayout
    }
}

extension SavedGifsViewController: SavedGifsPresenterOutput {

    func showModels() {
        collectionView.reloadData()
    }

    func showShareSheet(subject: String, body: String, gifUrl: URL) {

        let shareSheet = UIActivityViewController(activityItems: [body, gifUrl], applicationActivities: nil)
        shareSheet.setValue(subject, forKey: "Subject")
        shareSheet.configurePopover(with: view)
        present(shareSheet, animated: true, completion: nil)
        shareSheet.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
        }
    }
}
