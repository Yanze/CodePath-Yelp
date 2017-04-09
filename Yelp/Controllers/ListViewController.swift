//
//  ListViewController.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating  {
  
    var businesses = [Business]()
    var searchController = UISearchController(searchResultsController: nil)
    var currentBusinesses = [Business]()
    var detextedText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBusiness()
        setupSearchBar()
        tableView.estimatedRowHeight = 135

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let categories = UserDefaults.standard.object(forKey: "categories") as? [String]
        let deals = UserDefaults.standard.object(forKey: "isOfferingDeal") as? Bool
        
        BusinessManager.sharedInstance.searchBusiness(detextedText, sort: YelpSortMode.bestMatch, categories: categories, deals: deals) { (businesses) in
            self.businesses = businesses
            self.currentBusinesses = businesses
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
}

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
