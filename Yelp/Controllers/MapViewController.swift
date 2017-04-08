//
//  MapViewController.swift
//  Yelp
//
//  Created by yanze on 4/4/17.
//  Copyright © 2017 yanzeliu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let distanceSpan: CLLocationDegrees = 2000
        let location = CLLocationCoordinate2DMake(37.368832, -122.036346)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(location, distanceSpan, distanceSpan), animated: true)

        let pin = CustomAnnontation(title: "Title", subtitle: "Subtitle", coordinate: location)
        mapView.addAnnotation(pin)

        
        
    }
//    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let identifier = "annontation"
//        if annotation is CustomAnnontation {
//            if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
//                annotationView.annotation = annotation
//                return annotationView
//            }else {
//                let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//                annotationView.isEnabled = true
//                annotationView.canShowCallout = true
//                
//                let btn = UIButton(type: .detailDisclosure)
//                annotationView.rightCalloutAccessoryView = btn
//                return annotationView
//            }
//        }
//        return nil
//    }
//    

    
    
    
}


class CustomAnnontation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

