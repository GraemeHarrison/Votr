//
//  UIActivityViewController.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-04.
//

import UIKit

extension UIActivityViewController {

    func configurePopover(with view: UIView) {

        popoverPresentationController?.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
        popoverPresentationController?.sourceView = view
        popoverPresentationController?.canOverlapSourceViewRect = true
        popoverPresentationController?.permittedArrowDirections = []
    }
}
