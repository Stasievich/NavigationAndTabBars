//
//  ScrollViewController.swift
//  NavigationControllerTest
//
//  Created by Victor on 11/26/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {
    lazy var image = UIImage(named: "20200727_010744")
    lazy var imageView = UIImageView(image: image)
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 0.5
        
        scrollView.addSubview(imageView)
        imageView.fillView(scrollView)
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.zoomScale = 0.3
        view.addSubview(scrollView)
        scrollView.fillView(view)
        
        view.backgroundColor = .systemTeal
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }

}
