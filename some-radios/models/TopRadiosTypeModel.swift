//
//  TopRadiosTypeModel.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import Foundation

enum TopRadiosType {
    case ByClicks
    case ByVotes
    case ByRecentClick
    case ByRecentlyChange
    
    var description: String {
        switch self {
        case .ByClicks:
            return "By Clicks"
        case .ByVotes:
            return "By Votes"
        case .ByRecentClick:
            return "By Recent Click"
        case .ByRecentlyChange:
            return "By Recently Change"
        }
    }
}
