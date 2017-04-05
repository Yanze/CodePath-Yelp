//
//  ListViewController.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
  
    var businesses = [Business]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBusiness()
        tableView.estimatedRowHeight = 135
    }
    
    func searchBusiness() {
        Helpers.sharedInstance.searchBusiness(nil, sort: nil, categories: nil, deals: nil) { (businesses) in
            self.businesses = businesses
            self.tableView.reloadData()
        }
    }
    
    
    
    
}

//MARK: tableview methods
extension ListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell") as! BusinessCell
        cell.business = businesses[indexPath.row]
        return cell
    }
    
}
