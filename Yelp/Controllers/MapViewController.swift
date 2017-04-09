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


class MapViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var mapView: MKMapView!
    var searchController = UISearchController(searchResultsController: nil)
    
    var businesses = [Business]()
    var currentBusinesses = [Business]()
    var filteredBusinesses = [Business]()
    var locationManager = CLLocationManager()

    var locations = [BusinessAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        
        businesses = BusinessManager.sharedInstance.businesses
        currentBusinesses = BusinessManager.sharedInstance.businesses
        
        let centerLocation = CLLocation(latitude: 37.7833, longitude: -122.4167)
        goToLocation(location: centerLocation)
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 200
        locationManager.requestWhenInUseAuthorization()

        pinLocations(businesses: currentBusinesses)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    @IBAction func dismissViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        definesPresentationContext = true
        self.navigationItem.titleView = searchController.searchBar
    }
    
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
    }
    
    func removeAnnotations() {
        mapView.removeAnnotations(locations)
    }
    
    func pinLocations(businesses: [Business]) {
        for business in businesses {
            let coordinates = business.coordinates
            let address = business.address.joined(separator: ", ")
            let location = BusinessAnnotation(title: business.name, coordinate: CLLocationCoordinate2D(latitude: coordinates["latitude"]!, longitude: coordinates["longitude"]!), info:  address)
            locations.append(location)
        }
        mapView.addAnnotations(locations)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(location.coordinate, span)
            mapView.setRegion(region, animated: false)
        }
    }
    
    
    
}

//MARK: search bar methods
extension MapViewController {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchtext(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchtext(searchText: String, scope: String = "All") {
        let filteredBusinesses = businesses.filter {
            business in
            return business.name.lowercased().contains(searchText.lowercased())
        }
        if searchController.isActive && searchController.searchBar.text != "" {
            currentBusinesses = filteredBusinesses
        }
        else {
            currentBusinesses = businesses
        }
        BusinessManager.sharedInstance.searchedResults = currentBusinesses
    }
 
    
}




class BusinessAnnotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}

