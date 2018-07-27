//
//  TDSelectionCategory.swift
//  TDLikertScaleSelectorView
//
//  Created by Paul Leo on 27/07/2018.
//  Copyright © 2018 tapdigital Ltd. All rights reserved.
//

import Foundation

public enum TDSelectionCategory: String, CaseIterable {
    case stronglyAgree = "strongly agree"
    case agree = "agree"
    case neutral = "neutral"
    case disagree = "disagree"
    case stronglyDisagree = "strongly disagree"
    
    var localizedName: String {
        get {
            return NSLocalizedString(self.rawValue, comment: "Localised text for selection")
        }
    }
    
    var buttonTag: Int {
        get {
            switch self {
            case .stronglyAgree:
                return 0
            case .agree:
                return 1
            case .neutral:
                return 2
            case .stronglyDisagree:
                return 3
            case .disagree:
                return 4
            }
        }
    }
    
    static func category(fromTag tag: Int) -> TDSelectionCategory {
        switch tag {
        case 0:
            return .stronglyAgree
        case 1:
            return .agree
        case 2:
            return .neutral
        case 3:
            return .stronglyDisagree
        case 4:
            return .disagree
        default:
            return .stronglyAgree
        }
    }
}
