//
//  TableViewController.swift
//  NavigationControllerTest
//
//  Created by Victor on 11/29/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    

    let countries = ["Albania", "Australia", "Belgium", "Denmark",
                     "Germany", "Great Britain", "Greece", "India",
                     "Italy", "Morocco", "France", "Norway",
                     "Portugal", "Spain", "Sweden", "Switzerland",
                     "The Netherlands",  "Turkey", "Ukraine", "USA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Countries"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.dataSource = self
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let country = countries[indexPath.row]
        cell.textLabel?.text = country
        
        return cell
    }
}
