//
//  TableDataProtocol.swift
//  NavigationControllerTest
//
//  Created by Victor on 12/10/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import UIKit

struct Country: TableData {
    
    var object: String
    var image: UIImage
    
}

protocol TableData {
    var object: String { get }
    var image: UIImage { get }
}
