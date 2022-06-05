//
//  StudentFormVC+CustomMethods.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 13/05/22.
//

import Foundation
import UIKit
// MARK: - USER DEFINED METHODS
extension StudentFormVC{
    // TODO: INITIAL SETUP
    internal func initialSetup(){
        
    }
    
    // TODO: VALIDATE INPUT FIELDS
    internal func validateInputFields()->String?{
        if self.txtName.text?.isBlank == true{
            return "Please enter name."
        }else if self.txtAddress.text?.isBlank == true{
            return "Please enter address."
        }else if self.txtCity.text?.isBlank == true{
            return "Please enter city."
        }else if self.txtMobile.text?.isBlank == true{
            return "Please enter mobile number."
        }else{
            return nil
        }
    }
    
    
    
    // TODO: SAVE DATA INTO LOCAL DB
    internal func saveData(dict:[String:String]){
        DatabaseHelper.sharedInstance.save(object: dict)
        Utility.shared.showAlert(title: "Student", message: "Details saved successfully..!", buttonTitle: "OK", viewController: self) { [weak self] in
            guard let self = self else{return}
            self.emptyFields()
        }
    }
    
    
    // TODO: EDIT DATA INTO LOCAL DB
    internal func editData(dict:[String:String]){
        DatabaseHelper.sharedInstance.save(object: dict)
        Utility.shared.showAlert(title: "Student", message: "Details edit successfully..!", buttonTitle: "OK", viewController: self) { [weak self] in
            guard let self = self else{return}
            self.emptyFields()
        }
    }
    
    // TODO: EMPTY FIELDS
    internal func emptyFields(){
        self.txtName.text = String()
        self.txtAddress.text = String()
        self.txtCity.text = String()
        self.txtMobile.text = String()
    }
}
