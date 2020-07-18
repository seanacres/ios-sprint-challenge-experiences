//
//  CreateExperienceViewController.swift
//  Experiences
//
//  Created by Sean Acres on 7/18/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

import UIKit

class CreateExperienceViewController: UIViewController {

    @IBOutlet weak var experienceTitleTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var recordAudioButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func addPhotoTapped(_ sender: Any) {
    }
    
    @IBAction func recordAudioTapped(_ sender: Any) {
    }
    
    @IBAction func saveTapped(_ sender: Any) {
    }
}
