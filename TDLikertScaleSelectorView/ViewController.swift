//
//  ViewController.swift
//  TDLikertScaleSelector
//
//  Created by Paul Leo on 27/07/2018.
//  Copyright © 2018 tapdigital Ltd. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    struct MyBuildConfig: TDSelectionBuildConfig {
        var font: UIFont? = UIFont.systemFont(ofSize: 15)
        var textColor: UIColor?  = UIColor.purple
        var backgroundColorNormal: UIColor? = UIColor.clear
        var backgroundColorHighlighted: UIColor? = UIColor.lightGray
        var backgroundColorSelected: UIColor? = UIColor.red
        var backgroundColorHighlightedSelected: UIColor? = UIColor.lightGray
        var borderColor: UIColor? = .purple
        var borderWidth: CGFloat? = 2.0
        var buttonRadius: CGFloat? = 22
        var lineColor: UIColor? = .purple
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //example using code
        if let storyboardLikertView = self.view.viewWithTag(1) as? TDLikertScaleSelectorView {
            storyboardLikertView.delegate = self
        }
        
        var config = MyBuildConfig()
        if let likertView = TDLikertScaleSelectorView(withConfig: config, frame: CGRect.zero) {
            likertView.delegate = self
            likertView.tag = 2
            self.view.addSubviewForAutoLayout(likertView)
            NSLayoutConstraint.activate([
                likertView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                likertView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                likertView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
                likertView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
                ])
        }
        
        config.backgroundColorSelected = UIColor.brown
        config.backgroundColorNormal = UIColor.lightGray
        config.backgroundColorSelected = UIColor.green
        config.lineColor = UIColor.clear
        config.borderColor = UIColor.clear

        if let likertView = TDLikertScaleSelectorView(withConfig: config, frame: CGRect.zero) {
            likertView.delegate = self
            likertView.tag = 3
            self.view.addSubviewForAutoLayout(likertView)
            NSLayoutConstraint.activate([
                likertView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                likertView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                likertView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
                likertView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
                ])
        }
    }
}

extension ViewController: TDLikertScaleDelegate {
    func didSelect(category cat: TDSelectionCategory, tag: Int) {
        print("Question with tag \(tag) has answer \(cat.localizedName)")
    }
}

