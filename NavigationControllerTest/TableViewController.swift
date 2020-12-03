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
    

    let countries = [["Albania", "Australia", "Belgium", "Denmark"],
                     ["Germany", "Great Britain", "Greece", "India"],
                     ["Italy", "Morocco", "France", "Norway"],
                     ["Portugal", "Spain", "Sweden", "Switzerland"],
                     ["The Netherlands",  "Turkey", "Ukraine", "USA"]]
    
    
    init() {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Countries"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.dataSource = self
        self.tableView.rowHeight = 90
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.backgroundColor = {
            if indexPath.section % 2 == 1 {
                return .yellow
            }
            else {
                return .systemTeal
            }
        }()
        
        let selectedBackground = UIView()
        selectedBackground.backgroundColor = .red
        cell.selectedBackgroundView = selectedBackground
        
        let country = countries[indexPath.section][indexPath.row]
        cell.countryName.text = country
        cell.flagImage.image = UIImage(named: country)
        
        return cell
    }
    
}


class CustomCell: UITableViewCell {
    
    var flagImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        return img
    }()
    
    var countryName:  UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(flagImage)
        self.contentView.addSubview(countryName)
        
        flagImage.flagConstraints()
        countryName.countryNameConstraints(flagImage: flagImage, indent: 15)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
