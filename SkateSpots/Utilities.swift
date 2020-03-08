//
//  Utilities.swift
//  SkateSpots
//
//  Created by Heather Martin on 3/3/20.
//  Copyright © 2020 hedyCodes. All rights reserved.
//

import Foundation
import MapKit

let basePath:String = "https://api.darksky.net/forecast/" + dsApiKey + "/"
let exclusions:String = "?exclude=minutely,daily,hourly,alerts,flags"

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
  var subtitle: String? {
    return address! + "\n Hours: " + openingTime! + " - " + closingTime!
  }
}

extension ViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard let annotation = annotation as? SkateSpot else { return nil }
    let detailLabel = UILabel()
    detailLabel.numberOfLines = 0
    detailLabel.font = detailLabel.font.withSize(12)
    detailLabel.text = annotation.subtitle
    let identifier = "marker"
    var view: MKMarkerAnnotationView
    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
      as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      dequeuedView.addSubview(detailLabel)
      view = dequeuedView
    } else {
      view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }
}

class weatherData: NSObject, Decodable {
    let summary:String
    let precipitation:Double
    let windSpeed:Double
    let apparentTemperature:Double
    
    enum SerializationError:Error {
        case missing(String)
    }
    
    init(json:[String:Any]) throws {
        guard let summary = json["summary"] as? String else {throw SerializationError.missing("summary is missing")}
        guard let precip = json["precipProbability"] as? Double else { throw SerializationError.missing("precipication is missing") }
        guard let windspeed = json["windSpeed"] as? Double else { throw SerializationError.missing("windspeed is missing") }
        guard let apparenttemperature = json["apparentTemperature"] as? Double else {throw SerializationError.missing("apparent temperature is missing")}
        
        self.summary = summary
        self.precipitation = precip
        self.windSpeed = windspeed
        self.apparentTemperature = apparenttemperature
    }

}


