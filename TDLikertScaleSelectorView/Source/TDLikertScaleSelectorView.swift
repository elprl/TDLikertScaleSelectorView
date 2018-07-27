//
//  TDLikertScaleSelectorView.swift
//  TDLikertScaleSelectorView
//
//  Created by Paul Leo on 27/07/2018.
//  Copyright © 2018 tapdigital Ltd. All rights reserved.
//

import Foundation
import UIKit

open class TDLikertScaleSelectorView : UIView {
    var stackView : UIStackView!
    
    var buildConfig: TDSelectionBuildConfig?
    var delegate: TDLikertScaleDelegate?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
        setupConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initViews()
        setupConstraints()
    }
    
    convenience init?(withConfig config: TDSelectionBuildConfig, frame: CGRect) {
        self.init(frame: frame)
        self.buildConfig = config
    }
    
    func initViews() {
        stackView = UIStackView(frame: CGRect.zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
        
        
        TDSelectionCategory.allCases.forEach { cat in
            let containerView = TDSelectionContainerView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), category: cat, config: buildConfig)
            containerView.button.addTarget(self, action: #selector(TDLikertScaleSelectorView.didPressSelectorBtn(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(containerView)
        }
        
        self.addSubviewForAutoLayout(stackView)
    }
    
    func setupConstraints() {
        // stackView
        stackView.pin(to: self)        
    }
    
    @objc func didPressSelectorBtn(sender: UIButton) {
        if let category = TDSelectionCategory(rawValue: sender.tag) {
            delegate?.didSelect(category: category)
        }
    }
}
