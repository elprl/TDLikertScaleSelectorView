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

    var contentView: UIView!
    var label: UILabel!
    var button: TDRoundButton!
    var lineLeft: UIView!
    var lineRight: UIView!
    
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
        contentView = UIView()
        contentView.backgroundColor = .purple
        
        label = UILabel()
        label.text = category?.localizedName
        label.font = buildConfig?.font ?? UIFont.systemFont(ofSize: 16.0)
        label.textColor = buildConfig?.textColor ?? .black
        label.textAlignment = .center
        label.numberOfLines = 2

        button = TDRoundButton(type: .roundedRect)
        button.backgroundColorNormal = buildConfig?.backgroundColorNormal ?? .blue
        button.backgroundColorHighlighted = buildConfig?.backgroundColorHighlighted ?? .gray
        button.backgroundColorHighlightedSelected = buildConfig?.backgroundColorHighlightedSelected ?? .gray
        button.backgroundColorSelected = buildConfig?.backgroundColorSelected ?? .lightGray
        button.borderColor = buildConfig?.borderColor ?? .black
        button.borderWidth = buildConfig?.borderWidth ?? 2.0
        button.tag = category?.rawValue ?? 0
        
        lineLeft = UIView()
        lineRight = UIView()
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
        lineRight.backgroundColor = buildConfig?.lineColor ?? .black
    }
    
    func addViews() {
        self.addSubviewForAutoLayout(contentView)
        
        contentView.addSubviewForAutoLayout(label)
        contentView.addSubviewForAutoLayout(lineLeft)
        contentView.addSubviewForAutoLayout(lineRight)
        contentView.addSubviewForAutoLayout(button)
    }
    
    func setupConstraints() {
        // PARENT CONTENT VIEW
        contentView.pin(to: self)
        
        // BUTTON
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        let width = buildConfig?.buttonRadius ?? 20.0
        button.widthAnchor.constraint(equalToConstant: width * 2).isActive = true
        button.heightAnchor.constraint(equalToConstant: width * 2).isActive = true

        // LABEL
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0).isActive = true
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20.0).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: 0.0).isActive = true

        // LEFT LINE
        lineLeft.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        lineLeft.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        lineLeft.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        lineLeft.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        // RIGHT LINE
        lineRight.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        lineRight.leadingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        lineRight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        lineRight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
