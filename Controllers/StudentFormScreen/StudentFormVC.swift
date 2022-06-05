//
//  StudentFormVC.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 13/05/22.
//

import UIKit

class StudentFormVC: UIViewController{
    
    // MARK: - IBOUTLETS
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    // MARK: - PROPERTIES
    internal var i:Int = Int()
    internal var isUpdate:Bool = Bool()
    
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initialSetup()
    }
    
    // TODO: DEINIT
    deinit {
        print("StudentFormVC REMOVED FROM MEMORY...!")
    }
    
    // MARK: - ACTIONS
    // TODO: SAVE BUTTON TAPPED
    @IBAction func btnSaveTapped(_ sender: UIButton) {
        if let mssg = self.validateInputFields(){
            print(mssg)
            Utility.shared.showAlert(title: "Student", message: mssg, buttonTitle: "OK", viewController: self, completion: nil)
            return
        }
        let dict:[String:String] = ["name":(txtName.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines),
                                    "address":(txtAddress.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines),
                                    "city":(txtCity.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines),
                                    "mobile":(txtMobile.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)]
        if self.isUpdate{
            self.editData(dict: dict)
        }
        else{
            self.saveData(dict: dict)
        }
    }
    
    
    // TODO: SHOW BUTTON TAPPED
    @IBAction func btnShowTapped(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "TableVC") as? TableVC else {
            print("NO TableVC FOUND...!")
            return
        }
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
