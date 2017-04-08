//
//  SearchResultsViewController.swift
//  Yelp
//
//  Created by yanze on 4/7/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit

class SearchResultsViewController: UITableViewController  {

    var searchedBusinesses = [Business]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchedBusinesses = Helpers.sharedInstance.businesses
        print(searchedBusinesses)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchedBusinesses.count == 0 {
            return 0
        }
        return searchedBusinesses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath)
//        cell.result = searchedBusinesses[indexPath.row]
        cell.textLabel?.text = "hello"
        return cell
        
    }
    
    
    
    
}
