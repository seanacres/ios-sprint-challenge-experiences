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
    let title: String
    let image: UIImage?
    let audioRecording: URL?
    let latitude: Double
    let longitude: Double
    
    init(title: String, image: UIImage?, audioRecording: URL?, latitude: Double, longitude: Double) {
        self.title = title
        self.image = image
        self.audioRecording = audioRecording
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
