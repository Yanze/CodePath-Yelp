//
//  ViewController.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var mapView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggle(_ sender: UIButton) {
        self.mapView.isHidden = !self.mapView.isHidden
        self.listView.isHidden = !self.listView.isHidden
    }


}

