//
//  Cells.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation

import UIKit

extension UICollectionViewCell {

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    static var reuseId: String {
        return String(describing: self)
    }
}

extension UICollectionView {

    func registerCells(_ cells: [UICollectionViewCell.Type]) {

        for cell in cells {
            register(cell.nib, forCellWithReuseIdentifier: cell.reuseId)
        }
    }
}

extension UITableViewCell {

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    static var reuseId: String {
        return String(describing: self)
    }
}

extension UITableView {

    func registerCells(_ cells: [UITableViewCell.Type]) {

        for cell in cells {
            register(cell.nib, forCellReuseIdentifier: cell.reuseId)
        }
    }
}
