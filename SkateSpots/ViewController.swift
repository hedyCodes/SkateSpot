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
        SkateSpot(title: "Pflugerville Skate Park", openingTime: "8am", closingTime: "10pm", address: "15500 Sun Light Near Way, Pflugerville, TX 78660", coordinate: CLLocationCoordinate2D(latitude: 30.418027, longitude: -97.595756)),
        SkateSpot(title: "Shaylah Dame Skate Park", openingTime: "6am", closingTime: "10pm", address: "1600 Gattis School Rd, Round Rock, TX 78664", coordinate: CLLocationCoordinate2D(latitude: 30.497299, longitude: -97.660724)),
        SkateSpot(title: "Skate Spot", openingTime: "9am", closingTime: "10pm", address: "200 Immanuel Rd, Pflugerville, TX 78660", coordinate: CLLocationCoordinate2D(latitude: 30.434711, longitude: -97.611867)),
        SkateSpot(title: "Dick Nichols District Park", openingTime: "5am", closingTime: "10pm", address: "8011 Beckett Rd, Austin, TX 78749", coordinate: CLLocationCoordinate2D(latitude: 30.214087, longitude: -97.863447)),
        SkateSpot(title: "Garrison Park", openingTime: "8am", closingTime: "10pm", address: "6001 Menchaca Rd Austin, TX 78745", coordinate: CLLocationCoordinate2D(latitude: 30.212387, longitude: -97.801457)),
        SkateSpot(title: "Lakeway Skate Park", openingTime: "8am", closingTime: "9pm", address: " 3107 Lakeway Blvd, Lakeway, TX 78734", coordinate: CLLocationCoordinate2D(latitude: 30.351705, longitude: -97.994957)),
        SkateSpot(title: "Patterson Neighborhood Park", openingTime: "5am", closingTime: "10pm", address: "4200 Brookview Rd, Austin, TX 78722", coordinate: CLLocationCoordinate2D(latitude: 30.296537, longitude: -97.710305)),
        SkateSpot(title: "Wells Branch MUD Skatepark", openingTime: "6am", closingTime: "10pm", address: "3000 Shoreline Dr, Austin, TX 78728", coordinate: CLLocationCoordinate2D(latitude: 30.455198, longitude: -97.683450)),
        SkateSpot(title: "House Park", openingTime: "6am", closingTime: "10pm", address: "1301 Shoal Creek Blvd, Austin, TX 78701", coordinate: CLLocationCoordinate2D(latitude: 30.278160, longitude: -97.750004)),
        SkateSpot(title: "Buda Skatepark", openingTime: "6am", closingTime: "10pm", address: "480 S Loop 4, Buda, TX 78610", coordinate: CLLocationCoordinate2D(latitude: 30.075772, longitude: -97.845116)),
        SkateSpot(title: "Brushy Creek Sports Park", openingTime: "6am", closingTime: "10pm", address: "2310 Brushy Creek Rd, Cedar Park, TX 78613", coordinate: CLLocationCoordinate2D(latitude: 30.507013, longitude: -97.779629)),
    ]
    
    let startLocation: CLLocation = CLLocation(latitude: 30.272982, longitude: -97.774968)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .green
        let skateImageView = UIImageView(image: UIImage(named: "skatephoto.jpg"))
        skateImageView.contentMode = .scaleAspectFit
        tableView.backgroundView = skateImageView
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
    
    private func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.2)
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

