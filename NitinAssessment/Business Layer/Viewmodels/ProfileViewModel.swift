//
//  ProfileViewModel.swift
//  iOS Developer Assessment - Nitin Agnohotri
//
//  Created by yudhvir singh on 15/01/22.
//

import Foundation

class ProfileViewModel {
    
    func fetchUserProfile(_ userprofileUrl:String, completionBlock: ((UserData?, Error?, String?) -> Void)?) {
        ServiceHelper.request(params: [:], method: .get, apiName: "",apiURL:userprofileUrl) { responseData, err, statusCode in
            if err == nil {
                let res = responseData as! NSDictionary
                let data = UserData.init(fromDictionary: res)
                
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
}
