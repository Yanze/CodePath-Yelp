//
//  ViewController.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var searchResultsView: UIView!
    @IBOutlet weak var switchViewButton: UIButton!
    
    
    var searchController = UISearchController(searchResultsController: nil)
    var currentBusinesses = [Business]()
    var detextedText = ""
    var businesses = [Business]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBusiness()
        setupSearchBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggle(_ sender: UIButton) {
        self.mapView.isHidden = !self.mapView.isHidden
        self.listView.isHidden = !self.listView.isHidden
        if self.mapView.isHidden {
            sender.setTitle("Map", for: .normal)
        }
        else {
            sender.setTitle("List", for: .normal)
        }
    }
    
    @IBAction func filterButtonpressed(_ sender: UIButton) {
        let filterVc = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController")
        self.navigationController?.pushViewController(filterVc!, animated: true)
    }
    
    func searchBusiness() {
        Helpers.sharedInstance.searchBusiness(nil, sort: nil, categories: nil, deals: nil) { (businesses) in
            self.businesses = businesses
        }
    }
    
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        
        definesPresentationContext = true
        self.navigationItem.titleView = searchController.searchBar
    }
    
    //MARK: search bar delegate methods
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchtext(searchText: searchController.searchBar.text!)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        listView.isHidden = true
        mapView.isHidden = true
        searchResultsView.isHidden = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchResultsView.isHidden = true
        if switchViewButton.titleLabel?.text! == "Map" {
            listView.isHidden = false
            mapView.isHidden = true
        }
        else {
            listView.isHidden = true
            mapView.isHidden = false
        }
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
    }

    
    


}

