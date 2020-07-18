//
//  ExperienceMapViewController.swift
//  Experiences
//
//  Created by Sean Acres on 7/18/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

import UIKit
import MapKit

extension String {
    static let annotationReuseIdentifier = "ExperienceAnnotationView"
}

class ExperienceMapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    private var userTrackingButton: MKUserTrackingButton!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestWhenInUseAuthorization()
        
        userTrackingButton = MKUserTrackingButton(mapView: mapView)
        userTrackingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userTrackingButton)
        
        NSLayoutConstraint.activate([
            userTrackingButton.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
            mapView.bottomAnchor.constraint(equalTo: userTrackingButton.bottomAnchor, constant: 20)
        ])
        
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: .annotationReuseIdentifier)
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? CreateExperienceViewController else { return }
        destinationVC.locationManager = locationManager
    }

    
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
        
    }

}
