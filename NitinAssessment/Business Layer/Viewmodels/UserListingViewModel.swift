//
//  UserListingViewModel.swift
//  iOS Developer Assessment - Nitin Agnohotri
//
//  Created by yudhvir singh on 15/01/22.
//

import Foundation

enum ListScreenType {
    case followers
    case followings
}

class UserListingViewModel {
    var screenType = ListScreenType.followers
    var username = ""
}
