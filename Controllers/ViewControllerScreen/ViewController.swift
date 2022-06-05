//
//  ViewController.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 13/05/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOUTLETS
    
    // MARK: - PROPERTIES
    
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initialSetup()
    }

    // TODO: DEINIT
    deinit {
        print("ViewController REMOVED FROM MEMORY...!")
    }
    
    // MARK: - ACTIONS
    // TODO: SAVE BUTTON TAPPED
    
}

