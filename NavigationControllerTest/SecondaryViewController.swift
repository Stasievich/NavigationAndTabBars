//
//  SecondaryViewController.swift
//  NavigationControllerTest
//
//  Created by Victor on 11/29/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit
import ColorSlider
import Lottie

class SecondaryViewController: UITabBarController {
    var vc1 = UIViewController()
    var plantAnimationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = true
        vc1 = UIViewController("First", .orange, "umbrella")
        let vc2 = UIViewController("Second", .purple, "sun.min.fill")
        let vc3 = UIViewController("Third", .blue, "moon.fill")
        
        
        let plantAnimationView = AnimationView(name: "growing-plant")
        plantAnimationView.frame = vc1.view.bounds
        plantAnimationView.contentMode = .scaleAspectFit
        plantAnimationView.loopMode = .loop
        plantAnimationView.animationSpeed = 0.8
        vc1.view.addSubview(plantAnimationView)
        plantAnimationView.backgroundBehavior = .pauseAndRestore
        plantAnimationView.play()
        
        
        
        let colorSlider = ColorSlider(orientation: .vertical, previewSide: .left)
        colorSlider.frame = CGRect(x: vc1.view.frame.maxX - 30, y: 150, width: 12, height: 150)
        vc1.view.addSubview(colorSlider)
        colorSlider.addTarget(self, action: #selector(changedColor), for: .valueChanged)
        
        self.viewControllers = [vc1, vc2, vc3]
        
    }
    
    @objc func changedColor(_ slider: ColorSlider) {
        let color = slider.color
        vc1.view.backgroundColor = color
    }
    
    
}
