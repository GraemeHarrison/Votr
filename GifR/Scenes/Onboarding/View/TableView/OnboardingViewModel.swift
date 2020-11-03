// OnboardingViewModel.swift
// GifR
//
// Created by Graeme Harrison on 2020-11-02.
// 
//

import UIKit

enum OnboardingViewModel {

    case usernameInput(text: String?, placeholder: String)
    case emailInput(text: String?, placeholder: String)
    case passwordInput(text: String?, placeholder: String)
    case cta(title: String)

    var cellId: String {

        switch self {

        case .usernameInput,
             .emailInput,
             .passwordInput:
            return OnboardingTextFieldCell.reuseId

        case .cta: return OnboardingCTACell.reuseId
        }
    }
}
