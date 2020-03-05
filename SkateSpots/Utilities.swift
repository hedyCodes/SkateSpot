//
//  Utilities.swift
//  SkateSpots
//
//  Created by Heather Martin on 3/3/20.
//  Copyright © 2020 hedyCodes. All rights reserved.
//

import Foundation
import MapKit

class SkateSpot: NSObject, MKAnnotation {
  let title: String?
  let address: String?
  let openingTime: String?
  let closingTime: String?
  let coordinate: CLLocationCoordinate2D 
    init(title: String, openingTime: String, closingTime: String, address: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.address = address
    self.openingTime = openingTime
    self.closingTime = closingTime
    self.coordinate = coordinate
  }
//    init?(json: [String: Any]) {
//        self.title = json["Name"] as? String
//        self.address = json["Address"] as? String
//        self.openingTime = json["Open"] as? String
//        self.closingTime = json["Close"] as? String
//      if let latitude = Double(json["Latitiude"] as! String),
//        let longitude = Double(json["Longitude"] as! String) {
//      self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//      } else {
//        self.coordinate = CLLocationCoordinate2D()
//      }
//    }
  var subtitle: String? {
    return address! + "\n Hours: " + openingTime! + " - " + closingTime!
  }
}

//extension ViewController: MKMapViewDelegate {
//  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//    guard let annotation = annotation as? SkateSpot else { return nil }
//    let identifier = "marker"
//    var view: MKMarkerAnnotationView
//    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//      as? MKMarkerAnnotationView {
//      dequeuedView.annotation = annotation
//      view = dequeuedView
//    } else {
//      view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//      view.canShowCallout = true
//      view.calloutOffset = CGPoint(x: -5, y: 5)
//      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//    }
//    return view
//  }
//}

