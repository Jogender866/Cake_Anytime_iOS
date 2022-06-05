//
//  TableVC.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 16/05/22.
//

import UIKit
protocol DataPass{
    func data(object:[String:String], index:Int, isEdit:Bool)
}

class TableVC: UITableViewController {
    
    
    
    // MARK: - IBOUTLETS
    @IBOutlet var myTable: UITableView!
    
    // MARK: - PROPERTIES
    internal var student:[Student] = [Student]()
    internal var delegate:DataPass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // MARK: - TABLE VIEW DATA SOUCE AND DELEGATES
    // TODO: NUMBER OF ROWS IN SECTION
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.student.count
    }
    
    
    // TODO: CELL FOR ROW AT INDEXPATH
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as?  TableViewCell else{
            fatalError("NO TableViewCell FOUND...!")
        }
        cell.lblName.text = student[indexPath.row].name
        cell.lblCity.text = student[indexPath.row].city
        cell.lblAddress.text = student[indexPath.row].address
        cell.lblMobile.text = student[indexPath.row].mobile
        return cell
    }
    
    
    // TODO: CAN EDIT ROW AT INDEXPATH
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // TODO: COMMIT FOR ROW AT INDEXPATH
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            Utility.shared.showAlert(title: "Student", message: "Are you sure? You want to delete record", buttonTitle: "Delete", buttonCancelTitle: "Cancel", viewController: self) { [weak self] in
                guard let self = self else{return}
                self.student = DatabaseHelper.sharedInstance.deleteData(index: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic )
            } cancelCompletion: {
                print("DO NOTHING...!")
            }

            
        }
    }
    
    // TODO: DID SELECT ROW AT INDEXPATH
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name":student[indexPath.row].name,"address":student[indexPath.row].address,"city":student[indexPath.row].city,"mobile":student[indexPath.row].mobile]
        if let dict = dict as? [String:String]{
            self.delegate?.data(object: dict ,index: indexPath.row, isEdit: true)
            self.navigationController?.popViewController(animated: true)
            
        }
    }
}
