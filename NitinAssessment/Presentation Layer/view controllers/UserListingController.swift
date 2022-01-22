//
//  UserListingController.swift
//  iOS Developer Assessment - Nitin Agnohotri
//
//  Created by yudhvir singh on 15/01/22.
//

import UIKit

class UserListingController: UIViewController {
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    private let searchViewModel = SearchViewModel()
    private var usersModel: Users?
    private var itemsCount = 0
    private var pageNo = 1
    private var isEndReached = false
    private var searchedText = ""
    private var users = [UserData]()
    var followUrl = ""
    var currentPage : Int = 1
    var isLoadingList : Bool = false
    var isFollower = false
    var userListingViewmodel = UserListingViewModel()
    let refreshControl = UIRefreshControl()

    private func fetchUsersWithUsername() {
        searchViewModel.fetchUserProfile(followUrl, currentPage) { searchData, error,messageStr  in
            self.isLoadingList = false
            self.currentPage += 1
            if error == nil {
                if let searchD = searchData {
                    self.users.append(contentsOf: searchD)
                    self.tableView.reloadData()
                } else {
                    AlertController.alert(message: messageStr ?? "")
                }
            } else {
                AlertController.alert(message: error?.localizedDescription ?? "Error")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoadingList = true
        fetchUsersWithUsername()
        self.title = isFollower ? "Followers" : "Following"
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        refreshControl.endRefreshing()
        fetchUsersWithUsername()
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isLoadingList) {
            self.isLoadingList = true
            self.fetchUsersWithUsername()
        }
    }
}

extension UserListingController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellIdentifiers.userListCell) as? userListingCell {
            let name = self.users[indexPath.row].login
            let imageUrl = self.users[indexPath.row].avatarUrl

            cell.configure(username: name, image: imageUrl)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let url = self.users[indexPath.row].url {
            let controller = AppConstants.StoryBoards.main.instantiateViewController(withIdentifier: AppConstants.ViewControllerIdentifier.profileController) as! ProfileController
            controller.userProfileUrl = url
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
