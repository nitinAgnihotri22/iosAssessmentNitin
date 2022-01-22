//
//  SearchViewModel.swift
//  iOS Developer Assessment - Nitin Agnohotri
//
//  Created by yudhvir singh on 15/01/22.
//

import Foundation
import UIKit

class SearchViewModel {
    
    func fetchUserList(_ text:String,_ pageNo:Int,completionBlock: ((Users?, Error?,String?) -> Void)?) {
        let param = ["q":text,"page":pageNo] as [String : Any]
        ServiceHelper.request(params: param, method: .get, apiName: "search/users") { responseData, err, statusCode in
            if err == nil {
                let res = responseData as! NSDictionary
                let data = Users.init(fromDictionary: res)
                
                let messageStr = res["message"] as? String
                if messageStr != nil {
                    completionBlock!(nil,nil,messageStr)
                } else {
                    completionBlock!(data,nil,nil)
                }
            } else {
                completionBlock!(nil,err,nil)
            }
        }
    }
    
    func fetchUserProfile(_ text:String,_ pageNo:Int,completionBlock: (([UserData]?, Error?, String?) -> Void)?) {
        let param = ["page":pageNo] as [String : Any]
        ServiceHelper.request(params: param, method: .get, apiName: "",apiURL: text) { responseData, err, statusCode in
            if err == nil {
                let res = responseData as? [NSDictionary]
                var data = [UserData]()
                if let results = res {
                    for r in results {
                        data.append(UserData.init(fromDictionary: r))
                    }
                    completionBlock!(data,nil,nil)
                } else {
                    let resDict = responseData as? NSDictionary
                    var messageStr = ""
                    if let r = resDict {
                        messageStr = r["message"] as! String
                    }
                    completionBlock!(nil,nil,messageStr)
                }
            } else {
                completionBlock!(nil,err,nil)
            }
        }
    }
}


extension UIImageView {
    
    public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {
        
        if self.image == nil{
            self.image = PlaceHolderImage
        }
        
        if let cachedImage = ImageCache.shared.object(forKey: urlString as NSString) {
            print("Image from cache")
            self.image = cachedImage
        } else {
            URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
                
                if error != nil {
                    print(error ?? "No Error")
                    return
                }

                DispatchQueue.main.async(execute: { () -> Void in
                    let image = UIImage(data: data!)
                    ImageCache.shared.setObject(image ?? UIImage(), forKey: urlString as NSString)
                    self.image = image
                })
            }).resume()
        }
    }
}

