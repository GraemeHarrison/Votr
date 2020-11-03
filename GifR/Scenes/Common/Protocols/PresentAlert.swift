//
//  PresentAlert.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation
import UIKit

protocol PresentAlert: class {

    func presentGenericErrorAlert()
    func presentOkErrorAlert(title: AlertTitle?, message: String?)
    func presentOkErrorAlert(title: AlertTitle?, message: String?, completion: ActionBlock)
    var vc: (UIViewController & ShowAlert)? { get }
}

extension PresentAlert {

    func presentGenericErrorAlert() {
        vc?.showGenericErrorAlert()
    }

    func presentOkErrorAlert(title: AlertTitle?, message: String?) {
        vc?.showOneButtonAlert(actionTitle: .ok, title: title, message: message, completion: { (_) in })
    }

    func presentOkErrorAlert(title: AlertTitle?, message: String?, completion: ActionBlock) {
        vc?.showOneButtonAlert(actionTitle: .ok, title: title, message: message, completion: completion)
    }
}
