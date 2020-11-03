//
//  Home.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit

@objc protocol HomeViewControllerDelegate {
}

protocol HomePresenterOutput: class {
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
        presenter.eventViewReady()
    }
    
    @IBAction func likeTapped(_ sender: Any) {

    }

    @IBAction func randomGifTapped(_ sender: Any) {

    }
}

extension HomeViewController: HomePresenterOutput {}
