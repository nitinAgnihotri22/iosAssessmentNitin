//
//  ViewController.swift
//  iOS Developer Assessment - Nitin Agnohotri
//
//  Created by yudhvir singh on 15/01/22.
//

import UIKit

class SearchController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var noDataLbl: UILabel!
    private let searchViewModel = SearchViewModel()
    private var usersModel: Users?
    private var itemsCount = 0
    private var pageNo = 1
    private var isEndReached = false
    private var searchedText = ""
    private var items = [Item]()
    private var profUrl = ""
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableview.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        refreshControl.endRefreshing()
        fetchUsersWithUsername(searchedText)
    }

    private func fetchUsersWithUsername(_ name:String) {
        searchViewModel.fetchUserList(name,pageNo) { searchData, error,msg  in
            self.tableview.hideLoader()
            if error == nil {
                if let sData = searchData {
                    self.usersModel = sData
                    let items = self.usersModel?.items.count ?? 0
                    if items > 0 {
                        self.tableview.isHidden = false
                        self.noDataLbl.isHidden = true
                        self.pageNo += 1
                        self.itemsCount += items
                        self.items.append(contentsOf: (self.usersModel?.items!)!)
                        self.tableview.reloadData()
                    } else {
                        self.tableview.isHidden = true
                        self.noDataLbl.isHidden = false
                    }
                } else {
                    AlertController.alert(message: msg ?? "")
                }
            }
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.toggleArrowView()
    }
    
    private func toggleArrowView() {
        isEndReached = tableview.contentOffset.y >= 0
            && tableview.contentOffset.y+20 >= (tableview.contentSize.height - tableview.frame.size.height)
        if isEndReached {
            fetchUsersWithUsername(searchedText)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ProfileController {
            let vc = segue.destination as? ProfileController
            vc?.userProfileUrl = profUrl
        }
    }
}

extension SearchController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellIdentifiers.searchCell) as? SearchCell {
            let name = self.items[indexPath.row].login
            let imageUrl = self.items[indexPath.row].avatarUrl

            cell.configure(username: name, name: name, imageUrl: imageUrl)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let url = self.items[indexPath.row].url {
            profUrl = url
            performSegue(withIdentifier: AppConstants.SegueIdentifiers.searchToProfile, sender: self)
        }
    }
}

extension SearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            self.tableview.showLoader()
            self.items.removeAll()
            pageNo = 1
            self.itemsCount = 0
            searchedText = text
            fetchUsersWithUsername(text)
            self.view.endEditing(true)
        }
    }
}
