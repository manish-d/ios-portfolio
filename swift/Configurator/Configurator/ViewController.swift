//
//  ViewController.swift
//  Configurator
//
//  Created by Manish on 01/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblAPIEndpoint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.evaluateAPIEndpoint()
    }
    
    private func evaluateAPIEndpoint() {
        let endpoint = API.baseURL ?? URL(string: "")
        lblAPIEndpoint.text = endpoint?.absoluteString
    }


}

