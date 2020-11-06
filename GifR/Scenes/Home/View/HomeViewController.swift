//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit
import SDWebImage

protocol HomeViewControllerDelegate: class {}

protocol HomePresenterOutput: ShowAlert {
    func showGif(url: URL?) 
}

class HomeViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var likeButton: CTAButton!
    @IBOutlet var randomGifButton: CTAButton!

    var presenter: HomePresenter!
    private(set) weak var delegate: HomeViewControllerDelegate?

    func setParameters(delegate: HomeViewControllerDelegate) {
        self.delegate = delegate
    }

    override func awakeFromNib() {

        super.awakeFromNib()
        HomeConnector(viewController: self).configure()
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        title = "Vot'r"
        likeButton.style = .red
        randomGifButton.style = .blue
        likeButton.isEnabled = false
        configureNavBar()
        presenter.eventViewReady()
    }

    private func configureNavBar() {

        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        navigationItem.leftBarButtonItem = logoutButton

        let savedGifsButton = UIBarButtonItem(title: "Saved Gifs", style: .plain, target: self, action: #selector(savedGifsTapped))
        navigationItem.rightBarButtonItem = savedGifsButton
    }

    @objc private func logoutTapped() {
        presenter.eventLogoutTapped()
    }

    @objc private func savedGifsTapped() {
        presenter.eventSavedGifsTapped()
    }
    
    @IBAction func likeTapped(_ sender: Any) {

        likeButton.isEnabled = false
        presenter.eventLikeTapped()
    }

    @IBAction func randomGifTapped(_ sender: Any) {
        presenter.eventRandomGifTapped()
    }
}

extension HomeViewController: HomePresenterOutput {

    func showGif(url: URL?) {

        likeButton.isEnabled = true

        backgroundImageView.sd_setImage(with: url) { (image, error, _, _) in
        }

        imageView.sd_setImage(with: url) { (image, error, _, _) in
        }
    }
}
