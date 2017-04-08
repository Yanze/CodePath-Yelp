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
        tableView.tableFooterView = UIView()
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
    }
    

    @IBAction func calcelButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if dateCellExpanded {
                dateCellExpanded = false
            } else {
                dateCellExpanded = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if dateCellExpanded {
                return 250
            } else {
                return 50
            }
        }
        return 50

    }
    
    
}
