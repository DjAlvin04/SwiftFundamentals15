//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by spring2025 on 2/1/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeLabel(_ sender: Any) {
        mainLabel.text = "This app rocks!"
    }
    
}

