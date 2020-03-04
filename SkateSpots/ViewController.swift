//
//  ViewController.swift
//  SkateSpots
//
//  Created by Heather Martin on 3/3/20.
//  Copyright © 2020 hedyCodes. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    let regionRadius: CLLocationDistance = 7000

    var skateSpots: [SkateSpot] = [
        SkateSpot(title: "Pflugerville Skate Park", locationName: "Pflugerville Skate Park", openingTime: "8am", closingTime: "10pm", address: "15500 Sun Light Near Way, Pflugerville, TX 78660", coordinate: CLLocationCoordinate2D(latitude: 30.418027, longitude: -97.595756)),
        SkateSpot(title: "Shaylah Dame Skate Park", locationName: "Shaylah Dame Skate Park", openingTime: "6am", closingTime: "10pm", address: "1600 Gattis School Rd, Round Rock, TX 78664", coordinate: CLLocationCoordinate2D(latitude: 30.497299, longitude: -97.660724)),
        SkateSpot(title: "Skate Spot", locationName: "Skate Spot", openingTime: "9am", closingTime: "10pm", address: "200 Immanuel Rd, Pflugerville, TX 78660", coordinate: CLLocationCoordinate2D(latitude: 30.434711, longitude: -97.611867)),
        SkateSpot(title: "Lakeway Skate Park", locationName: "Lakeway Skate Park", openingTime: "8am", closingTime: "9pm", address: " 3107 Lakeway Blvd, Lakeway, TX 78734", coordinate: CLLocationCoordinate2D(latitude: 30.351705, longitude: -97.994957)),
        SkateSpot(title: "Patterson Neighborhood Park", locationName: "Patterson Neighborhood Park", openingTime: "5am", closingTime: "10pm", address: "4200 Brookview Rd, Austin, TX 78722", coordinate: CLLocationCoordinate2D(latitude: 30.296537, longitude: -97.710305)),
    ]
    
    let startLocation: CLLocation = CLLocation(latitude: 30.272982, longitude: -97.774968)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let skateySpot = SkateSpot(title: "Lakeway Skate Park",
          locationName: "Lakeway Skate Park", openingTime: "9am", closingTime: "10pm", address: "",
          coordinate: CLLocationCoordinate2D(latitude: 30.296537, longitude: -97.710305))
        mapView.addAnnotation(skateySpot)
        zoomMap(location: startLocation)
    }

    func zoomMap(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func setMapZoom(centerCoordinate: CLLocationCoordinate2D, radiusInKm radius: CLLocationDistance)
    {
        let diameter = radius * 2000
        let location = CLLocationCoordinate2D(latitude: 30.272982, longitude: -97.774968)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: diameter, longitudinalMeters: diameter)
        self.mapView.setRegion(region, animated: false)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = skateSpots[(indexPath as NSIndexPath).row].title
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return skateSpots.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let loc = CLLocation(latitude: skateSpots[indexPath.row].coordinate.latitude, longitude: skateSpots[indexPath.row].coordinate.longitude)
        zoomMap(location: loc)
        mapView.addAnnotation(skateSpots[indexPath.row])
    }
}

