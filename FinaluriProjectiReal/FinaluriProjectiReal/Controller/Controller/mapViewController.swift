//
//  mapViewController.swift
//  FinaluriProjectiReal
//
//  Created by konstantine gudushauri on 7/13/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class mapViewController: UIViewController {
    @IBOutlet var mapLocation: MKMapView!
    @IBOutlet var fildName: UITextField!
    let locationmanager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServiceEnabled()
        
    }
    
    private func checkLocationServiceEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkAuthorizationStatus()
            print("ჩართულია")
        } else {
            print("გამორთულია")
        }
    }
    private func setupLocationManager() {
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationmanager.startUpdatingLocation()
        case .authorizedAlways:
            break
        case .denied:
            break
        case .notDetermined:
            locationmanager.requestWhenInUseAuthorization()
            locationmanager.requestAlwaysAuthorization()
        case .restricted:
            break
        @unknown default:
            fatalError()
        }
    }
    
    
    @IBAction func addPin(_ sender: UILongPressGestureRecognizer) {
        
        let location = sender.location(in: self.mapLocation)
        let locCoord = self.mapLocation.convert(location, toCoordinateFrom: self.mapLocation)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locCoord
        annotation.title = fildName.text
        self.mapLocation.addAnnotation(annotation)
        
        
    }
    
    

}
extension mapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let coordinate = location.coordinate
        
        print("Lat: \(coordinate.latitude) Lng: \(coordinate.longitude)")
    }
}
