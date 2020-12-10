//
//  MainViewController.swift
//  NavigationControllerTest
//
//  Created by Victor on 11/23/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var toScrollBarButton = UIButton(type: .custom)
    var toTableViewButton = UIButton(type: .custom)
    var toTabBarButon = UIButton(type: .custom)
    var toTableViewClasswork = UIButton(type: .custom)
    var toCollection = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(toScrollBarButton)
        toScrollBarButton.buttonRelativePosition(top: view, 140)
        let toScrollBarButtonConfig = ButtonConfig(textColor: #colorLiteral(red: 0.1007879302, green: 0.05916041881, blue: 0.6460004449, alpha: 1), text: "To ScrollBar", textFont: .systemFont(ofSize: 20))
        setupButton(button: toScrollBarButton, config: toScrollBarButtonConfig)
        toScrollBarButton.addAction(for: .touchUpInside) { (toScrollBarButton) in
            let mvc = ScrollViewController()
            self.navigationController?.present(mvc, animated: true)
        }
        
        
        view.addSubview(toTabBarButon)
        toTabBarButon.buttonRelativePosition(top: toScrollBarButton, 70)
        setupButton(button: toTabBarButon, config: ButtonConfig(textColor: #colorLiteral(red: 0.1007879302, green: 0.05916041881, blue: 0.6460004449, alpha: 1), text: "To TabBar", textFont: .systemFont(ofSize: 20)))
        toTabBarButon.addAction(for: .touchUpInside) { (toTabBarButon) in
            let mvc = SecondaryViewController()
            self.navigationController?.present(mvc, animated: true)
        }
        
        view.addSubview(toTableViewButton)
        toTableViewButton.buttonRelativePosition(top: toTabBarButon, 70)
        setupButton(button: toTableViewButton, config: ButtonConfig(textColor: #colorLiteral(red: 0.1007879302, green: 0.05916041881, blue: 0.6460004449, alpha: 1), text: "To TableView", textFont: .systemFont(ofSize: 20)))
        toTableViewButton.addAction(for: .touchUpInside) { (toTableViewButton) in
            let mvc = TableViewController()
            self.navigationController?.pushViewController(mvc, animated: true)
        }
        
        view.addSubview(toCollection)
        toCollection.buttonRelativePosition(top: toTableViewButton, 70)
        setupButton(button: toCollection, config: ButtonConfig(textColor: #colorLiteral(red: 0.1007879302, green: 0.05916041881, blue: 0.6460004449, alpha: 1), text: "To Collection", textFont: .systemFont(ofSize: 20)))
        toCollection.addAction(for: .touchUpInside) { (toCollection) in
            let mvc = CollectionViewController()
            self.navigationController?.pushViewController(mvc, animated: true)
        }
        
        
        
    }

}


