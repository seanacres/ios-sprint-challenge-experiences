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
    
    var experiences: [Experience] = [] {
        didSet {
            let oldExperiences = Set(oldValue)
            let newExperiences = Set(experiences)
            
            let addedExperiences = Array(newExperiences.subtracting(oldExperiences))
            let removedExperiences = Array(oldExperiences.subtracting(newExperiences))
            
//            print(experiences.count)
//            print(addedExperiences.count)
//            print(removedExperiences.count)
            mapView.addAnnotations(addedExperiences)
            mapView.removeAnnotations(removedExperiences)
        }
    }
    
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

extension ExperienceMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let experience = annotation as? Experience else { return nil }
        
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: .annotationReuseIdentifier, for: experience) as? MKMarkerAnnotationView else {
            preconditionFailure("Missing the registered map annotation view")
        }
        
        annotationView.markerTintColor = .systemBlue
        
        return annotationView
    }
}
