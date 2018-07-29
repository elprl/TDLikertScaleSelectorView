//
//  TDSelectionBuildConfig.swift
//  TDLikertScaleSelectorView
//
//  Created by Paul Leo on 27/07/2018.
//  Copyright © 2018 tapdigital Ltd. All rights reserved.
//

import Foundation
import UIKit

public protocol TDSelectionBuildConfig {
    var font: UIFont? { get }
    var textColor: UIColor? { get }
    
    var backgroundColorNormal: UIColor? { get }
    var backgroundColorHighlighted: UIColor? { get }
    var backgroundColorSelected: UIColor? { get }
    var backgroundColorHighlightedSelected: UIColor? { get }
    var borderColor: UIColor? { get }
    var borderWidth: CGFloat? { get }
    var buttonRadius: CGFloat? { get }
    
    var lineColor: UIColor? { get }
}
