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
    
    
    var countryNames =  [["Albania", "Australia", "Belgium", "Denmark"],
                         ["France", "Germany", "Greece", "India"],
                         ["Italy", "Morocco", "Netherlands", "Norway"],
                         ["Portugal", "Spain", "Sweden", "Switzerland"],
                         ["Turkey", "Ukraine", "United Kingdom", "USA"]]
    
    
    var countries : [[TableData]] = [[Country]]()
    
    
    fileprivate func fillObjectsWithData(_ arrayOfNames: [[String]], _ objects: inout [[TableData]]) {
        for i in 0..<arrayOfNames.count {
            objects.append([TableData]())
            for j in 0..<arrayOfNames[i].count {
                let objectName = arrayOfNames[i][j]
                if let image = UIImage(named: objectName) {
                    objects[i].append(Country(object: objectName, image: image))
                }
            }
        }
    }
    
    init() {
        super.init(style: .insetGrouped)
        
        fillObjectsWithData(countryNames, &countries)
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
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print(scrollView.contentOffset)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cpvc = CountryProfileViewController()
        cpvc.countryName = countries[indexPath.section][indexPath.row].object
        if let countryDescription = CountryDescription.description[cpvc.countryName] {
            cpvc.countryDescription = countryDescription
        }
        navigationController?.pushViewController(cpvc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            countries[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
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
        cell.countryName.text = country.object
        cell.flagImage.image = country.image
        
        return cell
    }
    
}

extension CustomCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        flagImage.image = UIImage(named: textField.text!)
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
        countryName.delegate = self
        
        flagImage.flagConstraints()
        countryName.countryNameConstraints(flagImage: flagImage, indent: 15)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


