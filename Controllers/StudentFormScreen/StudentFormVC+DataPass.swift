//
//  StudentFormVC+DataPass.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 19/05/22.
//

import Foundation
import UIKit
extension StudentFormVC:DataPass{
    // TODO: DATA PASS
    internal func data(object: [String : String], index: Int, isEdit: Bool) {
        self.txtName.text = object["name"]
        self.txtAddress.text = object["address"]
        self.txtCity.text = object["city"]
        self.txtMobile.text = object["mobile "]
        self.i = index
        self.isUpdate = isEdit
    }
}
