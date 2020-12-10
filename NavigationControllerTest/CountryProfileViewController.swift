//
//  CountryProfileViewController.swift
//  NavigationControllerTest
//
//  Created by Victor on 12/6/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CountryProfileViewController: UIViewController {
    
    var countryName = String()
    var countryDescription = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let countryImage = UIImageView(image: UIImage(named: "\(countryName)-dc"))
        view.addSubview(countryImage)
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.contentMode = .scaleAspectFill
        countryImage.clipsToBounds = true
        
        view.addConstraints([
            countryImage.topAnchor.constraint(equalTo: view.topAnchor),
            countryImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            countryImage.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 15
        containerView.backgroundColor = #colorLiteral(red: 0.8064470887, green: 0.8808635473, blue: 0.9482396245, alpha: 1)
        view.addSubview(containerView)
        
        view.addConstraints([
            containerView.topAnchor.constraint(equalTo: countryImage.bottomAnchor, constant: -15),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        
        let countryLabel = UILabel()
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.text = countryName
        countryLabel.font = UIFont(name: "Helvetica-bold", size: 25)
        containerView.addSubview(countryLabel)
        
        containerView.addConstraints([
            countryLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            countryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
        ])
        
        
        let countryText = UITextView()
        countryText.translatesAutoresizingMaskIntoConstraints = false
        countryText.text = countryDescription
        countryText.font = UIFont(name: "Helvetica", size: 15)
        countryText.backgroundColor = #colorLiteral(red: 0.8064470887, green: 0.8808635473, blue: 0.9482396245, alpha: 1)
        containerView.addSubview(countryText)
        
        containerView.addConstraints([
            countryText.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 20),
            countryText.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -140),
            countryText.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            countryText.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
     
        
        let showOnMapButton = UIButton(type: .system)
        showOnMapButton.translatesAutoresizingMaskIntoConstraints = false
        showOnMapButton.setTitle("Show on map", for: .normal)
        showOnMapButton.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        showOnMapButton.titleLabel?.textColor = .systemIndigo
        showOnMapButton.layer.cornerRadius = 25
        showOnMapButton.backgroundColor = #colorLiteral(red: 0.6234633327, green: 0.6644259691, blue: 1, alpha: 1)
        containerView.addSubview(showOnMapButton)
        
        containerView.addConstraints([
            showOnMapButton.topAnchor.constraint(equalTo: countryText.bottomAnchor, constant: 20),
            showOnMapButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            showOnMapButton.widthAnchor.constraint(equalToConstant: 130),
            showOnMapButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        showOnMapButton.addAction(for: .touchUpInside) { (showOnMapButton) in
            let mvc = CountryMapViewController()
            if let countryCoords = CountryDescription.mapCoords[self.countryName] {
                mvc.countryCoords = countryCoords
            }
            mvc.countryName = self.countryName
            self.navigationController?.pushViewController(mvc, animated: true)
        }
        
        
    }
}


