//
//  AppConstants.swift
//  iOS Developer Assessment - Nitin Agnohotri
//
//  Created by yudhvir singh on 15/01/22.
//

import Foundation
import UIKit

class APIConstants {
    static let apiKey = ""
    struct URL {
        static let base  = "https://api.github.com/"         // local server
    }
}

class AppConstants {
    struct CellIdentifiers {
        static let searchCell = "searchCell"
        static let userListCell = "userListCell"
    }
    
    struct SegueIdentifiers {
        static let searchToProfile = "searchToProfile"
        static let profileToFollowers = "profileToFollowers"
    }
    
    struct Placeholders {
        static let username = "no username"
        static let name = "no name"
    }
    
    struct StoryBoards {
        static var main: UIStoryboard {
            get {
                return UIStoryboard(name: "Main",
                                    bundle: nil)
            }
        }
    }
    
    struct ViewControllerIdentifier {
        static let searchController = "searchController"
        static let profileController = "profileController"
        static let userListingController = "userListingController"
    }
}

class UIConstants {
    struct ColorConstant {
        static let backgroundColor = #colorLiteral(red: 0.1450980392, green: 0.1529411765, blue: 0.1725490196, alpha: 1)
        static let highlightColor = #colorLiteral(red: 0.137254902, green: 0.1529411765, blue: 0.1764705882, alpha: 1)
    }
    
    struct UIScalables {
        static let cornerRadius = CGFloat(5)
    }
}
