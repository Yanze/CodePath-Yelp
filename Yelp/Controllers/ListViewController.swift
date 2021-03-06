//
//  ListViewController.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit
import SVProgressHUD

class ListViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating  {
  
    var businesses = [Business]()
    var searchController = UISearchController(searchResultsController: nil)
    var currentBusinesses = [Business]()
    var detextedText = ""
    
    @IBOutlet weak var filterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupFilterButton()
        tableView.estimatedRowHeight = 135

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchBusinesses()
 
    }
    
    func setupFilterButton() {
        filterButton.layer.cornerRadius = 5
        filterButton.layer.borderWidth = 1.5
        filterButton.layer.borderColor = UIColor.white.cgColor
        filterButton.layer.shadowColor = UIColor.white.cgColor
        filterButton.layer.shadowOpacity = 0.5
        filterButton.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        filterButton.layer.shadowRadius = 15.0
    }
    
    func searchBusinesses() {
        SVProgressHUD.show()
        let categories = UserDefaults.standard.object(forKey: "categories") as? [String]
        let isOpenNow = UserDefaults.standard.object(forKey: "isOpenNow") as? Bool
        let sort = UserDefaults.standard.object(forKey: "sortByStringValue") as? String
        BusinessManager.sharedInstance.searchBusiness(detextedText, sort: sort, categories: categories, openNow: isOpenNow) { (businesses) in
            self.businesses = businesses
            self.currentBusinesses = businesses
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        definesPresentationContext = true
        self.navigationItem.titleView = searchController.searchBar
    }
    
    
    
    
}

//MARK: tableview methods
extension ListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentBusinesses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell") as! BusinessCell
        cell.business = currentBusinesses[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

//MARK: search bar methods
extension ListViewController {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchtext(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchtext(searchText: String, scope: String = "All") {
        let filteredBusinesses = businesses.filter {
            business in
            return business.name.lowercased().contains(searchText.lowercased())
        }
        if searchController.isActive && searchController.searchBar.text != "" {
            currentBusinesses = filteredBusinesses
        }
        else {
            currentBusinesses = businesses
        }
        BusinessManager.sharedInstance.searchedResults = currentBusinesses
        tableView.reloadData()
    }
}
