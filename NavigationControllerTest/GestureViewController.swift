//
//  GestureViewController.swift
//  NavigationControllerTest
//
//  Created by Victor on 12/10/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import UIKit

class GestureViewController: UIViewController {
    
    var boundsView = UIView()
    var rectangleHeight: CGFloat = 100
    var rectangleWidth: CGFloat = 100
    var indentX: CGFloat = 0.0
    var indentY: CGFloat = 0.0
    var leftBorder: CGFloat = 0.0
    var rightBorder: CGFloat = 0.0
    var topBorder: CGFloat = 0.0
    var bottomBorder: CGFloat = 0.0
    enum direction {
        case south
        case north
        case west
        case east
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .white
        
//        let view1 = addView(on: view, bottomOffset: -200, topOffset: 0)
//        let tap1 = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
//        view1.addGestureRecognizer(tap1)
//        view1.backgroundColor = .systemTeal
//
//        let view2 = addView(on: view1, bottomOffset: 100, topOffset: 100)
//        let tap2 = UIPanGestureRecognizer(target: self, action: #selector(onTap(_:)))
//        view2.addGestureRecognizer(tap2)
//        view2.backgroundColor = .systemPink
//        view2.isUserInteractionEnabled = false
        indentX = rectangleWidth / 2
        indentY = rectangleHeight / 2
        
        boundsView = addView(on: view, bottomOffset: -200, topOffset: 200)
        boundsView.backgroundColor = .systemTeal
        leftBorder = indentX
        rightBorder = boundsView.bounds.width - indentX
        topBorder = indentY
        bottomBorder = boundsView.bounds.height - indentY
        
        let squareView = addSquare(on: boundsView, height: rectangleHeight, width: rectangleWidth)
        squareView.backgroundColor = .systemPink
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        squareView.addGestureRecognizer(pan)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(onLongPress(_:)))
        squareView.addGestureRecognizer(longPress)
        
        
        
    }
    
    func addView(on superview: UIView, bottomOffset: CGFloat, topOffset: CGFloat) -> UIView {
        let view = UIView()
        superview.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: superview.topAnchor, constant: topOffset).isActive = true
        view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottomOffset).isActive = true
        
        return view
    }
    
    func addSquare(on superview: UIView, height: CGFloat, width: CGFloat) -> UIView {
        let view = UIView()
        superview.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        
        return view
        
    }
    
    @objc
    func onTap(_ gesture: UIGestureRecognizer) {
        print(gesture.location(in: gesture.view))
    }
    
    @objc
    func onPan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: boundsView)
        
        guard let gestureView = gesture.view else { return }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
            )
        
        gesture.setTranslation(.zero, in: boundsView)
        
        guard gesture.state == .ended else {
          return
        }

        gestureView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        let velocity = gesture.velocity(in: boundsView)
        let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))

        let slideFactor = magnitude / 200
        var finalPoint = CGPoint(
          x: gestureView.center.x + (velocity.x * slideFactor),
          y: gestureView.center.y + (velocity.y * slideFactor)
        )

        
        
        
        var tempPoint: CGPoint = CGPoint(x: gestureView.center.x, y: gestureView.center.y)
        var arrPath = [CGPoint]()
        
        //arrPath.append(twoLinesIntersection(firstLine: (tempPoint, finalPoint)).0)
        
        
        while !((finalPoint.x > indentX) && (finalPoint.x < boundsView.bounds.width - indentX)) &&
                !((finalPoint.y > indentY) && (finalPoint.y < boundsView.bounds.height - indentY)) {

            let calc = twoLinesIntersection(firstLine: (tempPoint, finalPoint))
            tempPoint.x = calc.0.x
            tempPoint.y = calc.0.y
            
            arrPath.append(tempPoint)
            
            switch calc.1 {
            case .east: finalPoint.x = finalPoint.x - 2 * (finalPoint.x - arrPath[arrPath.count - 1].x)
            case .north: finalPoint.y = finalPoint.y - 2 * (finalPoint.y - arrPath[arrPath.count - 1].y)
            case .west: finalPoint.x = finalPoint.x - 2 * (finalPoint.x - arrPath[arrPath.count - 1].x)
            case .south: finalPoint.y = finalPoint.y - 2 * (finalPoint.y - arrPath[arrPath.count - 1].y)
            }

        }
        
//
//        if direction == 1 {
//            tempPoint.x = velocityXDirection > 0 ? rightBorder : leftBorder
//            tempPoint.y = tempPoint.y + rightBorder / 2 / velocityXDirection * velocityYDirection
//        }
//        else {
//            tempPoint.y = velocityYDirection > 0 ? bottomBorder : topBorder
//            tempPoint.x = tempPoint.x + bottomBorder / 2 / velocityYDirection * velocityXDirection
//        }
//        arrPath.append(tempPoint)
        
        
//        while scuffed {
//            scuffed = false
//            tempPoint.x = min(max(finalPoint.x, indentX), boundsView.bounds.width - indentX)
//            tempPoint.y = min(max(finalPoint.y, indentY), boundsView.bounds.height - indentY)
//
//            if direction == 1 {
//                if !((finalPoint.x > indentX) && (finalPoint.x < boundsView.bounds.width - indentX)) {
//                    finalPoint.x = -(abs(finalPoint.x) - (boundsView.bounds.width - indentX))
//                    scuffed = true
//                }
//            }
//            else {
//                if !((finalPoint.y > indentY) && (finalPoint.y < boundsView.bounds.height - indentY)) {
//                    finalPoint.y = -(abs(finalPoint.y) - (boundsView.bounds.height - indentY))
//                    scuffed = true
//                }
//            }
//
//            arrPath.append(tempPoint)
//
//
//        }
        
//        UIView.animate(
//            withDuration: 1.0,
//            delay: 0,
//            usingSpringWithDamping: 1.0,
//            initialSpringVelocity: 0.5,
//            options: [.curveLinear],
//            animations: {
//                gestureView.center = tempPoint
//                gestureView.frame.size.width *= 1.2
//                gestureView.frame.size.height *= 1.2
//            })
        animate(view: gestureView, path: arrPath, numberOfTimes: arrPath.count)
    }
    
    func animate(view: UIView, path: [CGPoint], numberOfTimes: Int ) {

        if numberOfTimes == 0 { return }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {
            view.center = path[path.count - numberOfTimes]
           }, completion: { finished in
               self.animate(view: view, path: path, numberOfTimes: numberOfTimes - 1)
           })
       }
    
    func twoLinesIntersection(firstLine: (CGPoint, CGPoint)) -> (CGPoint, direction) {
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        if firstLine.0.x == firstLine.1.x {
            
            x = firstLine.0.x
            y = topBorder
            
            if y > min(firstLine.0.y, firstLine.1.y) && y < max(firstLine.0.y, firstLine.1.y) &&
                x > min(firstLine.0.x, firstLine.1.x) && x < max(firstLine.0.x, firstLine.1.x) {
                return (CGPoint(x: x, y: y), .north)
            }
            
            x = firstLine.0.x
            y = bottomBorder
            
            if y > min(firstLine.0.y, firstLine.1.y) && y < max(firstLine.0.y, firstLine.1.y) &&
                x > min(firstLine.0.x, firstLine.1.x) && x < max(firstLine.0.x, firstLine.1.x) {
                return (CGPoint(x: x, y: y), .south)
            }
            
        }
        
        else if firstLine.0.y == firstLine.1.y {
            
            y = firstLine.0.y
            x = rightBorder
            
            if y > min(firstLine.0.y, firstLine.1.y) && y < max(firstLine.0.y, firstLine.1.y) &&
                x > min(firstLine.0.x, firstLine.1.x) && x < max(firstLine.0.x, firstLine.1.x) {
                return (CGPoint(x: x, y: y), .east)
            }
            
            
            y = firstLine.0.y
            x = leftBorder
            
            if y > min(firstLine.0.y, firstLine.1.y) && y < max(firstLine.0.y, firstLine.1.y) &&
                x > min(firstLine.0.x, firstLine.1.x) && x < max(firstLine.0.x, firstLine.1.x) {
                return (CGPoint(x: x, y: y), .west)
            }
            
            
        }
        
        else {
            
            let m = (firstLine.1.y - firstLine.0.y) / (firstLine.1.x - firstLine.0.x)
            
            x = rightBorder
            y = m * (x - firstLine.0.x) + firstLine.0.y
            
            if y > min(firstLine.0.y, firstLine.1.y) && y < max(firstLine.0.y, firstLine.1.y) &&
                x > min(firstLine.0.x, firstLine.1.x) && x < max(firstLine.0.x, firstLine.1.x) {
                return (CGPoint(x: x, y: y), .east)
            }
            
            
            x = leftBorder
            y = m * (x - firstLine.0.x) + firstLine.0.y
            
            if y > min(firstLine.0.y, firstLine.1.y) && y < max(firstLine.0.y, firstLine.1.y) &&
                x > min(firstLine.0.x, firstLine.1.x) && x < max(firstLine.0.x, firstLine.1.x) {
                return (CGPoint(x: x, y: y), .west)
            }
            
            
            y = bottomBorder
            x = (y - firstLine.0.y) / m + firstLine.0.x
            
            if y > min(firstLine.0.y, firstLine.1.y) && y < max(firstLine.0.y, firstLine.1.y) &&
                x > min(firstLine.0.x, firstLine.1.x) && x < max(firstLine.0.x, firstLine.1.x) {
                return (CGPoint(x: x, y: y), .south)
            }
            
            
            y = topBorder
            x = (y - firstLine.0.y) / m + firstLine.0.x
            
            if y > min(firstLine.0.y, firstLine.1.y) && y < max(firstLine.0.y, firstLine.1.y) &&
                x > min(firstLine.0.x, firstLine.1.x) && x < max(firstLine.0.x, firstLine.1.x) {
                return (CGPoint(x: x, y: y), .north)
            }
            
        }
        return (CGPoint(x: 0, y: 0), .east)
    }
    
    @objc
    func onLongPress(_ gesture: UILongPressGestureRecognizer) {
        gesture.view?.backgroundColor = .red
    }
}
