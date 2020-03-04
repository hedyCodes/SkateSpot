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
  var subtitle: String? {
    return address! + "\n Hours: " + openingTime! + " - " + closingTime!
  }
}
