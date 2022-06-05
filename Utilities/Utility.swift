//
//  Utility.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 19/05/22.
//

import Foundation
import UIKit
class Utility{
    // MARK: - SHARED INSTANCE (SINGLETON OBJECT)
    static let shared:Utility = Utility()
    private init(){}
    
    // MARK: - UIALERTS
    // TODO: UIALERT WITH SINGLE BUTTON
    
    internal func showAlert(title:String,message:String,buttonTitle:String,viewController:UIViewController,completion:(()->())?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: { action in
            completion?()
        }))
        // show the alert
        viewController.present(alert, animated: true, completion: nil)
    }
    
    
    // TODO: UIALERT WITH DELETE AND CANCEL BUTTON
    internal func showAlert(title:String,message:String,buttonTitle:String,buttonCancelTitle:String,viewController:UIViewController,completion:(()->())?,cancelCompletion:(()->())?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.destructive, handler: { action in
            completion?()
        }))
        
        alert.addAction(UIAlertAction(title: buttonCancelTitle, style: UIAlertAction.Style.cancel, handler: { action in
            cancelCompletion?()
        }))
        
        // show the alert
        viewController.present(alert, animated: true, completion: nil)
    }
}
