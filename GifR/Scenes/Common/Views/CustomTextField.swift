//
//  CustomTextField.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-04.
//

import UIKit

class CustomTextField: UITextField {

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

    override var textColor: UIColor? {
        get { return super.textColor } set {}
    }

    override var borderStyle: UITextField.BorderStyle {
        get { return super.borderStyle } set {}
    }

    override var font: UIFont! {
        get { return super.font } set {}
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 16)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 16)
    }

    private func postInitSetUp() {

        super.borderWidth = 1
        super.cornerRadius = 12
        super.backgroundColor = .white
        super.borderColor = .lightGray
        super.textColor = .black
        super.font =  .body
        super.borderStyle = .roundedRect
    }

    public override init(frame: CGRect = CGRect.zero ) {
        super.init(frame: frame)
        postInitSetUp()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        postInitSetUp()
    }
}
