//
//  TableVC+CustomMethods.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 17/05/22.
//

import Foundation
import UIKit
// MARK: - USER DEFINED METHODS
extension TableVC{
    // TODO: INITIAL SETUP
    internal func initialSetup(){
        self.student = DatabaseHelper.sharedInstance.getStudentData()
        
        self.myTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
}
