//
//  Globals.swift
//  Swiggy-Assignment
//
//  Created by Nitin on 20/01/22.
//

import Foundation
import UIKit

struct StoryBoards {
    static let main = UIStoryboard.init(name: "Main", bundle: nil)
}

import UIKit

struct ProgressDialog {
    static var alert = UIAlertController()
    static var progressView = UIProgressView()
    static var progressPoint : Float = 0{
        didSet{
            if(progressPoint == 1){
                ProgressDialog.alert.dismiss(animated: true, completion: nil)
            }
        }
    }
}

//_ item: @autoclosure () -> Any
func addLoader(_ item: String? = "",
               _ viewController: UIViewController? = nil) {
    DispatchQueue.main.async {
        if let viewController = viewController {
            MBProgressHUD.hide(for: viewController.view, animated: true)
            let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
            if let text = item {
                hud.label.text = text
            }
        }
    }
}

func hideLoader(_ viewController: UIViewController? = nil) {
    DispatchQueue.main.async {
        if let viewController = viewController {
            MBProgressHUD.hide(for: viewController.view, animated: true)
        }
    }
}

extension UILabel {
    
    func attibutedString(_ str1:String,_ str2:String) {
        let boldAttr = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0)]
        let regularAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        
        let partOne = NSMutableAttributedString(string: str1, attributes: boldAttr as [NSAttributedString.Key : Any])
        let partTwo = NSMutableAttributedString(string: str2, attributes: regularAttr as [NSAttributedString.Key : Any])
        
        let combination = NSMutableAttributedString()
        combination.append(partOne)
        combination.append(partTwo)
        self.attributedText = combination
    }
}
