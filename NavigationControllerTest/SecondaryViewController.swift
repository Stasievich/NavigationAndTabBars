//
//  SecondaryViewController.swift
//  NavigationControllerTest
//
//  Created by Victor on 11/29/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit

class SecondaryViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UIViewController("First", .orange, "umbrella")
        let vc2 = UIViewController("Second", .purple, "sun.min.fill")
        let vc3 = UIViewController("Third", .blue, "moon.fill")
        
        self.viewControllers = [vc1, vc2, vc3]
        
    }
    
}
