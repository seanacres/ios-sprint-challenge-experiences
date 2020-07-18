//
//  Experience.swift
//  Experiences
//
//  Created by Sean Acres on 7/18/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

import Foundation
import MapKit

class Experience: NSObject {
    let experienceTitle: String
    let image: UIImage?
    let audioRecording: URL?
    let latitude: Double
    let longitude: Double
    
    init(title: String, image: UIImage?, audioRecording: URL?, latitude: Double, longitude: Double) {
        self.experienceTitle = title
        self.image = image
        self.audioRecording = audioRecording
        self.latitude = latitude
        self.longitude = longitude
    }
    
}

extension Experience: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    var title: String? {
        experienceTitle
    }
}
