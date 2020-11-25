//
//  MainViewController.swift
//  NavigationControllerTest
//
//  Created by Victor on 11/23/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var navButton = UIButton(type: .custom)
    var tabBarButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navButton)
        navButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints([
            navButton.widthAnchor.constraint(equalToConstant: 144),
            navButton.heightAnchor.constraint(equalToConstant: 50),
            navButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navButton.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 140)
        ])
        
        let navButtonConfig = ButtonConfigs(textColor: #colorLiteral(red: 0.1007879302, green: 0.05916041881, blue: 0.6460004449, alpha: 1), text: "To View", textFont: .systemFont(ofSize: 20))
        setupButton(button: navButton, config: navButtonConfig)
        navButton.addTarget(self, action: #selector(navPressed(_:)), for: .touchUpInside)
        
        
        view.addSubview(tabBarButton)
        tabBarButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints([
            tabBarButton.widthAnchor.constraint(equalToConstant: 144),
            tabBarButton.heightAnchor.constraint(equalToConstant: 50),
            tabBarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tabBarButton.centerYAnchor.constraint(equalTo: navButton.bottomAnchor, constant: 70)
        ])
        
        let tabBarButtonConfig = ButtonConfigs(textColor: #colorLiteral(red: 0.1007879302, green: 0.05916041881, blue: 0.6460004449, alpha: 1), text: "To TabBar", textFont: .systemFont(ofSize: 20))
        setupButton(button: tabBarButton, config: tabBarButtonConfig)
        tabBarButton.addTarget(self, action: #selector(tabBarButtonPressed(_:)), for: .touchUpInside)
        
//        var mvc = SecondaryViewController()
//        mvc.title = "Red"
//        navigationController?.pushViewController(mvc, animated: true)
//        var mvc1 = TernaryViewController()
//        navigationController?.present(mvc1, animated: true)
        
        
    }

    
    func setupButton(button: UIButton, config: ButtonConfiguration) {
        button.backgroundColor = .systemIndigo
        button.setTitle(config.text, for: .normal)
        button.setTitleColor(config.textColor, for: .normal)
        button.titleLabel?.font = config.textFont
        button.isOpaque = true
    }

    @objc func navPressed(_ sender: Any){
        let mvc = UIViewController()
        mvc.view.backgroundColor = .red
        navigationController?.present(mvc, animated: true)
    }
    
    @objc func tabBarButtonPressed(_ sender: Any){
        let vc1 = setUpViewController("First", .orange, "umbrella")
        let vc2 = setUpViewController("Second", .purple, "sun.min.fill")
        let vc3 = setUpViewController("Third", .blue, "moon.fill")
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [vc1, vc2, vc3]
        
        navigationController?.present(tabBarController, animated: true)
    }
    
    func setUpViewController(_ title: String, _ backgroundColor: UIColor, _ image: String) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = backgroundColor
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(systemName: image)
        return vc
    }

}


