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
        
//        scrollView.contentSize = CGSize(width: 2000, height: 2000)
        
//        scrollView.bounces = false
        //scrollView.indicatorStyle
        
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 0.5
        
        scrollView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addConstraints([
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            imageView.rightAnchor.constraint(equalTo: scrollView.rightAnchor)
        ])
        
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.zoomScale = 0.3
        view.addConstraints([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        view.backgroundColor = .systemTeal
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }

}
