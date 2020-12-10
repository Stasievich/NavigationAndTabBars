//
//  CountryMapViewController.swift
//  NavigationControllerTest
//
//  Created by Victor on 12/6/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CountryMapViewController: UIViewController {
    
    var countryCoords = (CLLocationDegrees, CLLocationDegrees)(0,0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let mapView = MKMapView()
        let location = CLLocation(latitude: countryCoords.0, longitude: countryCoords.1)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.centerToLocation(location)
        view.addSubview(mapView)
        
        view.addConstraints([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
    }
    
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 500000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
