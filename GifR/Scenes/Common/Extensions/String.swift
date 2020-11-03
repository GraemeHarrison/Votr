//
//  String.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import Foundation

extension String {

    func isValidUsername() -> Bool {

        let format = "^[a-zA-Z0-9]*$"
        let regex = NSPredicate(format: "SELF MATCHES %@", format)
        return regex.evaluate(with: self)
    }

    func isValidEmail() -> Bool {

        let format = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let regex = NSPredicate(format:"SELF MATCHES %@", format)
        return regex.evaluate(with: self)
    }

    func isValidPassword() -> Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).count > 5
    }
}
