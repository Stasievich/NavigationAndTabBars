//
//  ButtonProtocol.swift
//  NavigationControllerTest
//
//  Created by Victor on 11/25/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import UIKit

protocol ButtonConfiguration {
    var textColor: UIColor { get }
    var text: String { get }
    var textFont: UIFont { get }
}

struct ButtonConfigs: ButtonConfiguration {
    
    
    var textColor: UIColor
    
    var text: String
    
    var textFont: UIFont
    
}
