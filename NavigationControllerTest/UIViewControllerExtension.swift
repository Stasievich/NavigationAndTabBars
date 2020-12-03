//
//  UIViewControllerExtension.swift
//  NavigationControllerTest
//
//  Created by Victor on 11/29/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    convenience init (_ title: String, _ backgroundColor: UIColor, _ image: String) {
        self.init()
        self.view.backgroundColor = backgroundColor
        self.tabBarItem.title = title
        self.tabBarItem.image = UIImage(systemName: image)
    }
    
}
