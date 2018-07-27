//
//  TDRoundButton.swift
//  TDLikertScaleSelectorView
//
//  Created by Paul Leo on 27/07/2018.
//  Copyright © 2018 tapdigital Ltd. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable open class TDRoundButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.width
        clipsToBounds = true
    }
    
//    var isToggle: Bool = false {
//        didSet {
//            if isToggle {
//                self.addTarget(self, action: Selector(("touchUpInside:")), for: .touchUpInside)
//            } else {
//                self.removeTarget(self, action: Selector(("touchUpInside:")), for: .touchUpInside)
//            }
//        }
//    }
    
    var backgroundColorNormal: UIColor? {
        didSet {
            backgroundColor = backgroundColorNormal
        }
    }
    
    var backgroundColorHighlighted: UIColor?
    private var _backgroundColorHighlighted: UIColor? {
        return backgroundColorHighlighted ?? backgroundColorNormal
    }
    
    var backgroundColorSelected: UIColor?
    private var _backgroundColorSelected: UIColor? {
        return backgroundColorSelected ?? _backgroundColorHighlighted
    }
    
    var backgroundColorHighlightedSelected: UIColor?
    private var _backgroundColorHighlightedSelected: UIColor? {
        return backgroundColorHighlightedSelected ?? _backgroundColorHighlighted
    }
    
    override open var isHighlighted: Bool {
        didSet {
            paintBackground()
            print("isHighlighted = \(isHighlighted)")
        }
    }
    
    override open var isSelected: Bool {
        didSet {
            paintBackground()
            print("isSelected = \(isSelected)")
        }
    }
    
    private func paintBackground() {
        switch (isHighlighted, isSelected) {
        case (true, false):
            backgroundColor = _backgroundColorHighlighted
        case (true, true):
            backgroundColor = _backgroundColorHighlightedSelected
        case (false, true):
            backgroundColor = _backgroundColorSelected
        default:
            backgroundColor = backgroundColorNormal
        }
    }
}
