//
//  TDSelectionContainerView.swift
//  TDLikertScaleSelectorView
//
//  Created by Paul Leo on 27/07/2018.
//  Copyright © 2018 tapdigital Ltd. All rights reserved.
//

import Foundation
import UIKit

protocol TDLikertScaleDelegate {
    func didSelect(category cat: TDSelectionCategory)
}

open class TDSelectionContainerView: UIView {
    var buildConfig: TDSelectionBuildConfig?
    var category: TDSelectionCategory?

    let label = UILabel()
    let button = TDRoundButton()
    let lineLeft = UIView()
    let lineRight = UIView()

    init(frame: CGRect, category: TDSelectionCategory?, config: TDSelectionBuildConfig?) {
        self.buildConfig = config
        self.category = category
        
        super.init(frame: frame)
        
        initViews()
        addViews()
        setupConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initViews()
        addViews()
        setupConstraints()
    }

    
    func initViews() {
        self.backgroundColor = .yellow
        self.translatesAutoresizingMaskIntoConstraints = false

        label.text = category?.localizedName
        label.font = buildConfig?.font ?? UIFont.systemFont(ofSize: 16.0)
        label.textColor = buildConfig?.textColor ?? .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        
        button.backgroundColorNormal = buildConfig?.backgroundColorNormal ?? .clear
        button.backgroundColorHighlighted = buildConfig?.backgroundColorHighlighted ?? .gray
        button.backgroundColorHighlightedSelected = buildConfig?.backgroundColorHighlightedSelected ?? .gray
        button.backgroundColorSelected = buildConfig?.backgroundColorSelected ?? .lightGray
        button.borderColor = buildConfig?.borderColor ?? .black
        button.borderWidth = buildConfig?.borderWidth ?? 2.0
        button.backgroundColor = .red
        button.tag = category?.buttonTag ?? 0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        switch category {
        case .some(.stronglyAgree):
            lineLeft.isHidden = true
            lineRight.isHidden = false
        case .some(.stronglyDisagree):
            lineLeft.isHidden = false
            lineRight.isHidden = true
        default:
            lineLeft.isHidden = false
            lineRight.isHidden = false
        }
        lineLeft.backgroundColor = buildConfig?.lineColor ?? .black
        lineLeft.translatesAutoresizingMaskIntoConstraints = false

        lineRight.backgroundColor = buildConfig?.lineColor ?? .black
        lineRight.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addViews() {
        self.addSubview(label)
        self.addSubview(lineLeft)
        self.addSubview(lineRight)
        self.addSubview(button)
    }
    
    func setupConstraints() {
        // BUTTON
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true

        // LABEL
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0).isActive = true
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20.0).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        // LEFT LINE
        lineLeft.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        lineLeft.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        lineLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lineLeft.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        // RIGHT LINE
        lineRight.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        lineRight.leadingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        lineRight.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lineRight.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        // Inform the contraints engine to update the constraints
        self.setNeedsUpdateConstraints()
    }
}
