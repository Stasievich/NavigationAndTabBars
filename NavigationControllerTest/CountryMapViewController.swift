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
    
    var countryName = String()
    var countryCoords = (CLLocationDegrees, CLLocationDegrees)(0,0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let mapView = MKMapView()
        let location = CLLocation(latitude: countryCoords.0, longitude: countryCoords.1)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.centerToLocation(location, countryName)
        view.addSubview(mapView)
        
        mapView.fillView(view)
        
    }
    
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    _ countryName: String
  ) {
    if let region = CountryDescription.regionRadius[countryName] {
        let regionRadius: CLLocationDistance = region
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
  }
}
