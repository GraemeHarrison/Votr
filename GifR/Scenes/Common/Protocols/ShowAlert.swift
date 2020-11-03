//
//  ShowAlert.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation
import UIKit

enum AlertActionTitle: String {

    case ok = "Ok"
    case gotIt = "Got it!"
    case cancel = "Cancel"
    case tryAgain = "Try again"
}

enum AlertTitle: String {

    case oops = "Oops!"
    case error = "Error"
    case success = "Success!"
}
typealias ActionBlock = ((UIAlertAction) -> ())?

protocol ShowAlert: class {}

extension ShowAlert where Self: UIViewController {

    func showGenericErrorAlert(withButton: Bool = true) {

        showOneButtonAlert(actionTitle: .ok, title: .oops, message: "Something went wrong. Please try again later.", withButton: withButton, completion: { (_) in })
    }

    func showOneButtonAlert(actionTitle: AlertActionTitle, title: AlertTitle?, message: String?, withButton: Bool = true, completion: ActionBlock) {

        var actions: [UIAlertAction] = []
        if withButton {
            actions.append(UIAlertAction(title: actionTitle.rawValue, style: .default, handler: completion))
        }
        showAlert(title: title?.rawValue, message: message, actions: actions)
    }

    func showAlert(title: String?, message: String?, actions: [UIAlertAction]) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        _ = actions.map { alertController.addAction($0) }
        present(alertController, animated: true, completion: nil)
    }
}
