//
//  TDSelectionContainerView.swift
//  TDLikertScaleSelectorView
//
//  Created by Paul Leo on 27/07/2018.
//  Copyright © 2018 tapdigital Ltd. All rights reserved.
//

import Foundation
import UIKit

open class TDSelectionContainerView: UIView {
    var buildConfig: TDSelectionBuildConfig?
    
    let label: UILabel
    let button: TDRoundButton
    let lineLeft: UIView
    let lineRight: UIView

    public override init(frame: CGRect) {
        label = UILabel()
        button = TDRoundButton()
        lineRight = UIView()
        lineLeft = UIView()
        
        super.init(frame: frame)
        
        initViews()
        addViews()
        setupConstraints()
    }
    
    convenience init?(withConfig config: TDSelectionBuildConfig, frame: CGRect) {
        self.init(frame: frame)
        self.buildConfig = config
    }
    
    required public init?(coder aDecoder: NSCoder) {
        label = UILabel()
        button = TDRoundButton()
        lineRight = UIView()
        lineLeft = UIView()

        super.init(coder: aDecoder)
        
        initViews()
        addViews()
        setupConstraints()
    }
    
    
    func initViews() {
        label.text = buildConfig?.labelName
        label.font = buildConfig?.font ?? UIFont.systemFont(ofSize: 17.0)
        label.textColor = buildConfig?.textColor ?? .black
        
        button.backgroundColorNormal = buildConfig?.backgroundColorNormal
        button.backgroundColorHighlighted = buildConfig?.backgroundColorHighlighted
        button.backgroundColorHighlightedSelected = buildConfig?.backgroundColorHighlightedSelected
        button.backgroundColorSelected = buildConfig?.backgroundColorSelected
        button.borderColor = buildConfig?.borderColor ?? .black
        button.borderWidth = buildConfig?.borderWidth ?? 2.0
        button.backgroundColor = .red
        
        lineLeft.backgroundColor = buildConfig?.lineColor ?? .black
        lineRight.backgroundColor = buildConfig?.lineColor ?? .black
    }
    
    func addViews() {
        self.addSubview(label)
        self.addSubview(button)
        self.addSubview(lineLeft)
        self.addSubview(lineRight)
    }
    
    func setupConstraints() {
        // Get the superview's layout
        let margins = self.layoutMarginsGuide
        
        // BUTTON
        // centre button in parent
        button.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true

        // LABEL
        // Pin the leading edge of myView to the margin's leading edge
        label.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        // Pin the trailing edge of myView to the margin's trailing edge
        label.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        // pin label under button
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20.0).isActive = true
        label.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
//        label.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 1, constant: 0)

        // LINES
        lineLeft.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        // Pin the trailing edge of lineLeft to buttons leading edge
        lineLeft.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        lineLeft.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineLeft.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true

        lineRight.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        // Pin the leading edge of lineRight to buttons trailing edge
        lineRight.leadingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        lineRight.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        lineRight.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true

//        let views = ["label" : label, "button": button, "lineLeft": lineLeft, "lineRight": lineRight]
//        let hFormatString = "H:|-[lineLeft]-[button(==40)]-[lineRight]-|"
//        let vFormatString = "V:|-[button(==40)]-20-[label]-|"
//
//        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: hFormatString, options: .alignAllCenterY, metrics: nil, views: views)
//        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: vFormatString, options: .alignAllCenterX, metrics: nil, views: views)
//
//        NSLayoutConstraint.activate(hConstraints)
//        NSLayoutConstraint.activate(vConstraints)
    }

}
