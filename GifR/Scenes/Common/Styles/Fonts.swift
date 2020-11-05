//
//  Fonts.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-04.
//

import UIKit

extension UIFont {

    static var body: UIFont { return .systemFont(ofSize: 16, weight: .regular) }
    static var smallBold: UIFont { return .systemFont(ofSize: 16, weight: .semibold) }
    static var bold: UIFont { .systemFont(ofSize: 18, weight: .bold) }
    static var heading1: UIFont { return .systemFont(ofSize: 40, weight: .bold) }
    static var heading2: UIFont { return .systemFont(ofSize: 32, weight: .semibold) }
    static var heading3: UIFont { return .systemFont(ofSize: 24, weight: .medium) }
    static var heading4: UIFont { return .systemFont(ofSize: 20, weight: .medium) }
    static var heading5: UIFont { return .systemFont(ofSize: 18, weight: .medium) }
    static var heading6: UIFont { return .systemFont(ofSize: 16, weight: .medium) }
}
