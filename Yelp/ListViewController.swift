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

    }
    
    
    
    
}

//MARK: tableview methods
extension ListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell") as! BusinessCell
        return cell
    }
    
}
