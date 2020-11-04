//
// SavedGifsViewModel.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import UIKit

enum SavedGifsViewModel {

    case template

    var cellId: String {

        switch self {

        case .template:
            return SavedGifsCell.reuseId
        }
    }

    var height: CGFloat {

        switch self {

        case .template:
            return 0
        }
    }

    var width: CGFloat {

        switch self {

        case .template:
            return 0
        }
    }
}
