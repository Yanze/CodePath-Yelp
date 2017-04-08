//
//  FilterTableViewController.swift
//  Yelp
//
//  Created by yanze on 4/6/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit


class FilterTableViewController: UITableViewController {

    
    private var dateCellExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
    }
    

    @IBAction func calcelButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    
    
}
