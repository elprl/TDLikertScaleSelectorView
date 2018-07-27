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
    let stackView = UIStackView()
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
        self.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = true
        
        self.addSubview(stackView)

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .blue
        
        TDSelectionCategory.allCases.forEach { cat in
            let containerView = TDSelectionContainerView(frame: CGRect.zero, category: cat, config: buildConfig)
            containerView.button.addTarget(self, action: #selector(TDLikertScaleSelectorView.didPressSelectorBtn(sender:)), for: .touchUpInside)
            containerView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(containerView)
        }
    }
    
    func setupConstraints() {
        // stackView
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    @objc func didPressSelectorBtn(sender: UIButton) {
        delegate?.didSelect(category: TDSelectionCategory.category(fromTag: sender.tag))
    }
}
