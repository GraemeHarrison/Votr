// OnboardingViewModel.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

enum OnboardingViewModel {

    case template

    var cellId: String {

        switch self {

        case .template:
            return OnboardingCell.reuseId
        }
    }
}
