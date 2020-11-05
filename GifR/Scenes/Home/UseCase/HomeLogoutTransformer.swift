//
//  HomeLogoutTransformer.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-04.
//

import Foundation
import Firebase

class HomeLogoutTransformer {

    func transform(presenter: HomeUseCaseOutput?) {

        presenter?.presentYesNoAlert(title: nil, message: "Are you sure you want to logout?", yesTitle: "Yes", noTitle: "Cancel", completion: { (action) in

            if action.style == .default {
                self.logout(presenter: presenter)
            }
        })
    }

    private func logout(presenter: HomeUseCaseOutput?) {

        do {
            try Auth.auth().signOut()
        }
        catch let error as NSError {

            print("Error loggin out: \(error)")
            presenter?.presentOkErrorAlert(title: .oops, message: "We were unable to log out of your account. Please try again later.")
        }
    }
}
