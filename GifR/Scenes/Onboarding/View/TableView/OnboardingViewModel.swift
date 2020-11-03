// OnboardingViewModel.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

enum OnboardingViewModel {

    case usernameInput(text: String?, placeholder: String)

    var cellId: String {

        switch self {

        case .usernameInput:
            return OnboardingTextFieldCell.reuseId
        }
    }
}
