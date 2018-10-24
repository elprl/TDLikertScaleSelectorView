//
//  ExampleTableView.swift
//  TDLikertScaleSelectorView
//
//  Created by Paul Leo on 28/07/2018.
//  Copyright © 2018 tapdigital Ltd. All rights reserved.
//

import Foundation
import UIKit

open class ExampleTableView: UITableViewController {
    
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

    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var styleConfig = MyBuildConfig()

        switch indexPath.row {
        case 0:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "questionCellId")
            cell.textLabel?.text = "Q1. President Trump is doing good work."
            return cell
        case 1:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "answerCellId")
            cell.selectionStyle = .none
            let likertView = TDLikertScaleSelectorView(withConfig: styleConfig)
            likertView.delegate = self
            likertView.tag = indexPath.row
            likertView.clipsToBounds = true
            cell.contentView.addSubviewForAutoLayout(likertView)
            likertView.pin(to: cell.contentView, withPadding: 10)
            return cell
        case 2:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
            cell.textLabel?.text = "Q2. A trained monkey could do better."
            return cell
        case 3:
            styleConfig.buttonRadius = 15
            styleConfig.font = UIFont.boldSystemFont(ofSize: 14)
            let cell = UITableViewCell(style: .default, reuseIdentifier: "answerCellId")
            cell.selectionStyle = .none
            let likertView = TDLikertScaleSelectorView(withConfig: styleConfig)
            likertView.delegate = self
            likertView.tag = indexPath.row
            likertView.clipsToBounds = true
            cell.contentView.addSubviewForAutoLayout(likertView)
            likertView.pin(to: cell.contentView, withPadding: 10)
            return cell
        case 4:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
            cell.textLabel?.text = "Q3. There was no COLLUSION with Russia."
            return cell
        case 5:
            styleConfig.buttonRadius = 30
            styleConfig.font = UIFont.boldSystemFont(ofSize: 8)
            styleConfig.backgroundColorSelected = .purple
            let cell = UITableViewCell(style: .default, reuseIdentifier: "answerCellId")
            cell.selectionStyle = .none
            let likertView = TDLikertScaleSelectorView(withConfig: styleConfig)
            likertView.delegate = self
            likertView.tag = indexPath.row
            likertView.clipsToBounds = true
            cell.contentView.addSubviewForAutoLayout(likertView)
            likertView.pin(to: cell.contentView, withPadding: 10)
            return cell
        default:
            return UITableViewCell()
        }
    }

    open override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row % 2) == 0 {
            return 30
        } else {
            return 120
        }
    }
}

extension ExampleTableView: TDLikertScaleDelegate {
    public func didSelect(category cat: TDSelectionCategory, tag: Int) {
        print("Question with tag \(tag) has answer \(cat.localizedName)")
    }
}

