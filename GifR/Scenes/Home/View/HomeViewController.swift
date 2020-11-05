//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit
import SDWebImage

@objc protocol HomeViewControllerDelegate {
}

protocol HomePresenterOutput: ShowAlert {
    func showGif(url: URL?) 
}

class HomeViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var randomGifButton: UIButton!

    var presenter: HomePresenter!
    private(set) var delegate: HomeViewControllerDelegate?

    func setParameters(delegate: HomeViewControllerDelegate) {
        self.delegate = delegate
    }

    override func awakeFromNib() {

        super.awakeFromNib()
        HomeConnector(viewController: self).configure()
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        configureSavedGifsButton()
        presenter.eventViewReady()
    }

    private func configureSavedGifsButton() {

        let savedGifsButton = UIBarButtonItem(title: "Saved Gifs", style: .plain, target: self, action: #selector(savedGifsTapped))
        navigationItem.rightBarButtonItem = savedGifsButton
    }

    @objc private func savedGifsTapped() {
        presenter.eventSavedGifsTapped()
    }
    
    @IBAction func likeTapped(_ sender: Any) {
        presenter.eventLikeTapped()
    }

    @IBAction func randomGifTapped(_ sender: Any) {
        presenter.eventRandomGifTapped()
    }
}

extension HomeViewController: HomePresenterOutput {

    func showGif(url: URL?) {

        imageView.sd_setImage(with: url) { (image, error, _, _) in
        }
    }
}
