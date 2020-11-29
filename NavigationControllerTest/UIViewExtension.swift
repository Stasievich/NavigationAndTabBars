//
//  UIViewExtension.swift
//  NavigationControllerTest
//
//  Created by Victor on 11/29/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func fillView(_ view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func buttonRelativePosition(top: UIView, _ yPosition: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        widthAnchor.constraint(equalToConstant: 144).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        centerXAnchor.constraint(equalTo: top.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: top.topAnchor, constant: yPosition).isActive = true
    }
}
