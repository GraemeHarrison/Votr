//
//  CTAButton.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-04.
//

import Foundation
import UIKit

class CTAButton: UIButton {

    enum Style {

        case red
        case blue
    }
    var titleColor: UIColor = .white
    var style: Style = .red {
        didSet {
            updateStyle()
        }
    }

    override var isEnabled: Bool {
        didSet {
            updateStyle()
        }
    }

    static var font: UIFont = .bold
    private var disabledColor: UIColor = .lightGray

    override var borderWidth: CGFloat {
        get { return super.borderWidth } set {}
    }

    override var cornerRadius: CGFloat {
        get { return super.cornerRadius } set {}
    }

    override var borderColor: UIColor? {
        get { return super.borderColor } set {}
    }

    override var backgroundColor: UIColor? {
        get { return super.backgroundColor } set {}
    }

    override var contentEdgeInsets: UIEdgeInsets {
        get { return super.contentEdgeInsets } set {}
    }

    public override init(frame: CGRect = CGRect.zero ) {
        super.init(frame: frame)
        postInitSetUp()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        postInitSetUp()
    }

    private func postInitSetUp() {

        super.cornerRadius = 12
//        super.borderWidth = 2
        updateStyle()
        super.titleLabel?.font = type(of: self).font
        super.setTitleColor(.white, for: .normal)
        let inset: CGFloat = 16
        super.contentEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }

    private func updateStyle() {
        isEnabled ? setEnabledStyle() : setDisabledStyle()
    }

    private func setEnabledStyle() {

        switch style {

        case .red:
            super.backgroundColor = .red

        case .blue:
            super.backgroundColor = .blue
        }
    }

    private func setDisabledStyle() {

        super.setTitleColor(.white, for: .disabled)
        super.backgroundColor = disabledColor
    }
}
