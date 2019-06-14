//
//  ProfileTVC.swift
//  Dr. Abdelrhman Arwish Clinic
//
//  Created by Abdelrhman on 6/13/19.
//  Copyright © 2019 Dr. Abdelrhman Arwish Clinic. All rights reserved.
//


import UIKit


class ProfileTVC: UITableViewController {
    var TableArray = [String]()
    
    let section = ["pizza", "deep dish pizza", "calzone"]
    
    let items = [["Margarita", "BBQ Chicken", "Pepperoni"], ["sausage", "meat lovers", "veggie lovers"], ["sausage", "chicken pesto", "prawns", "mushrooms"]]
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return self.section[section]
    }
   
   
    override func numberOfSections(in tableView: UITableView) -> Int {
          return section.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return items[section].count
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = items[indexPath.section][indexPath.row]
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       return 40
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
}
