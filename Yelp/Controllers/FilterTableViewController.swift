//
//  FilterTableViewController.swift
//  Yelp
//
//  Created by yanze on 4/6/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit


class FilterTableViewController: UITableViewController {

    @IBOutlet weak var offerDealSwitchbutton: UISwitch!
    @IBOutlet weak var americanCategorySwitchButton: UISwitch!
    @IBOutlet weak var chineseCategorySwitchButton: UISwitch!
    @IBOutlet weak var frenchCategorySwitchButton: UISwitch!
    @IBOutlet weak var italianCategorySwitchButton: UISwitch!
    @IBOutlet weak var distancePickerView: UIPickerView!
    
    
    let defaults = UserDefaults.standard
    var conponents = ["Auto", "0.3 miles", "1 mile", "5 miles", "20 miles"]
    var distanceSelectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distancePickerView.delegate = self
        distancePickerView.dataSource = self
        
        setupIsOfferingDealSwitchButtonValue(type: "isOfferingDeal", switchButton: offerDealSwitchbutton)
        setupIsOfferingDealSwitchButtonValue(type: "isAmericanCategoryOn", switchButton: americanCategorySwitchButton)
        setupIsOfferingDealSwitchButtonValue(type: "isChineseCategoryOn", switchButton: chineseCategorySwitchButton)
        setupIsOfferingDealSwitchButtonValue(type: "isFrenchCategoryOn", switchButton: frenchCategorySwitchButton)
        setupIsOfferingDealSwitchButtonValue(type: "isItalianCategoryOn", switchButton: italianCategorySwitchButton)

        if defaults.object(forKey: "distancePickerViewIndex") == nil {
            distancePickerView.selectedRow(inComponent: 0)
            
        }else {
            distancePickerView.selectRow(defaults.object(forKey: "distancePickerViewIndex") as! Int, inComponent: 0, animated: true)
        }

        tableView.tableFooterView = UIView()

    }


    @IBAction func searchButtonPressed(_ sender: UIButton) {
        offerDealSwitchbutton.isOn ? defaults.set(true, forKey: "isOfferingDeal") : defaults.set(false, forKey: "isOfferingDeal")
        defaults.set(distanceSelectedRow, forKey: "distancePickerViewIndex")
        saveCategories()

        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func calcelButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    func setupIsOfferingDealSwitchButtonValue(type: String, switchButton: UISwitch) {
        
        if defaults.object(forKey: type) == nil {
            switchButton.setOn(false, animated: true)
        }
        else {
            let isOn = defaults.object(forKey: type) as! Bool
            switchButton.setOn(isOn, animated: true)
        }
    }

    func saveCategories() {
        americanCategorySwitchButton.isOn ? defaults.set(true, forKey: "isAmericanCategoryOn") : defaults.set(false, forKey: "isAmericanCategoryOn")
        
        chineseCategorySwitchButton.isOn ? defaults.set(true, forKey: "isChineseCategoryOn") : defaults.set(false, forKey: "isChineseCategoryOn")
        
        frenchCategorySwitchButton.isOn ? defaults.set(true, forKey: "isFrenchCategoryOn") : defaults.set(false, forKey: "isFrenchCategoryOn")
        
        italianCategorySwitchButton.isOn ? defaults.set(true, forKey: "isItalianCategoryOn") : defaults.set(false, forKey: "isItalianCategoryOn")
        
        var categories = [String]()
        if americanCategorySwitchButton.isOn {
            categories.append("american")
        }else if chineseCategorySwitchButton.isOn {
            categories.append("chinese")
        }else if frenchCategorySwitchButton.isOn {
            categories.append("french")
        }else if italianCategorySwitchButton.isOn {
            categories.append("italian")
        }
        defaults.set(categories, forKey: "categories")
    }
    
}

extension FilterTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.conponents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.conponents[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        distanceSelectedRow = row
    }
    
}
