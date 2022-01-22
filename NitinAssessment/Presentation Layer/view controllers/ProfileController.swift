//
//  ProfileController.swift
//  iOS Developer Assessment - Nitin Agnohotri
//
//  Created by yudhvir singh on 15/01/22.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var followerContainerView: UIView!
    @IBOutlet weak var followersView: UIView!
    @IBOutlet weak var followingView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFollowersCount: UILabel!
    @IBOutlet weak var lblFollowingsCount: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    private var userProfileViewModel = ProfileViewModel()
    var userProfileUrl:String?
    private var userData:UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        followersView.addTapGesture {
            self.followersClicked()
        }
        
        followingView.addTapGesture {
            self.followingClicked()
        }
        getUserProfile()
    }
    
    private func getUserProfile() {
        addLoader(nil, self)
        if let url = userProfileUrl {
            userProfileViewModel.fetchUserProfile(url) { profileData, error,messageStr  in
                hideLoader(self)
                if error == nil {
                    if let userProfile = profileData {
                        self.updateUIData(userProfile)
                        self.userData = userProfile
                    } else {
                        AlertController.alert(message: messageStr!)
                    }
                } else {
                    AlertController.alert(message: error?.localizedDescription ?? "Error")
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.imageContainerView.layer.cornerRadius = self.imageContainerView.frame.height/2
        self.userView.layer.cornerRadius = UIConstants.UIScalables.cornerRadius
        self.followerContainerView.layer.cornerRadius = UIConstants.UIScalables.cornerRadius
        self.descriptionView.layer.cornerRadius = UIConstants.UIScalables.cornerRadius
    }
    
    private func updateUIData(_ data:UserData) {
        
        self.avatarImage.imageFromServerURL(urlString: data.avatarUrl ?? "", PlaceHolderImage: UIImage())
        self.lblUsername.text = data.login
        if let name = data.name as? String {
            self.lblName.text = name
            self.title = name
        } else {
            self.lblName.text = data.login
            self.title = data.login
        }
        self.lblFollowersCount.text = "\(data.followers!)"
        self.lblFollowingsCount.text = "\(data.following!)"
        
        if let bio = data.bio as? String {
            self.descriptionLbl.text = bio
        } else {
            self.descriptionLbl.text = "No description available."
        }

    }
    
    func followersClicked() {
        // navigate to followers
        let controller = AppConstants.StoryBoards.main.instantiateViewController(withIdentifier: AppConstants.ViewControllerIdentifier.userListingController) as! UserListingController
        controller.isFollower = true
        let followersCount = self.userData?.followers ?? 0
        if let url = self.userData?.followersUrl,followersCount > 0 {
            controller.followUrl = url
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func followingClicked() {
        // navigate to followings
        let controller = AppConstants.StoryBoards.main.instantiateViewController(withIdentifier: AppConstants.ViewControllerIdentifier.userListingController) as! UserListingController
        controller.isFollower = false
        let following = self.userData?.following ?? 0

        if let url = self.userData?.followingUrl,following > 0 {
            let str = url.replacingOccurrences(of: "{/other_user}", with: "")
            controller.followUrl = str
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
