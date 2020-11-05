//
// SavedGifsViewModel.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-04.
//

import UIKit

enum SavedGifsViewModel {

    case gif(url: URL?)

    var cellId: String {

        switch self {

        case .gif:
            return SavedGifsCell.reuseId
        }
    }
}
