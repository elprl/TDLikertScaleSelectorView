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
        self.backgroundColor = .yellow
        self.translatesAutoresizingMaskIntoConstraints = false

        label.text = buildConfig?.labelName ?? "strongly agree"
        label.font = buildConfig?.font ?? UIFont.systemFont(ofSize: 17.0)
        label.textColor = buildConfig?.textColor ?? .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        button.backgroundColorNormal = buildConfig?.backgroundColorNormal
        button.backgroundColorHighlighted = buildConfig?.backgroundColorHighlighted
        button.backgroundColorHighlightedSelected = buildConfig?.backgroundColorHighlightedSelected
        button.backgroundColorSelected = buildConfig?.backgroundColorSelected
        button.borderColor = buildConfig?.borderColor ?? .black
        button.borderWidth = buildConfig?.borderWidth ?? 2.0
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        
        lineLeft.backgroundColor = buildConfig?.lineColor ?? .black
        lineLeft.translatesAutoresizingMaskIntoConstraints = false

        lineRight.backgroundColor = buildConfig?.lineColor ?? .black
        lineRight.translatesAutoresizingMaskIntoConstraints = false
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
        button.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true

        // LABEL
        label.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20.0).isActive = true
        label.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true

        // LEFT LINE
        lineLeft.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        lineLeft.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        lineLeft.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        lineLeft.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true

        // RIGHT LINE
        lineRight.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        lineRight.leadingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        lineRight.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        lineRight.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        
        // Inform the contraints engine to update the constraints
        self.setNeedsUpdateConstraints()
    }


}
