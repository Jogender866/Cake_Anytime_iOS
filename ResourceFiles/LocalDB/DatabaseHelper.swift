//
//  DatabaseHelper.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 16/05/22.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper{
    
    static let sharedInstance:DatabaseHelper = DatabaseHelper()
    private init(){}
    
    // MARK: - SAVE STUDENT DETAILS
    internal let context =  (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    internal func save(object:[String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: self.context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        do {
            try self.context?.save()
        } catch{
            print("Data is not saved")
        }
    }
    
    
    // MARK: - FETCH STUDENT DETAILS
    internal func getStudentData() -> [Student]{
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            student = try self.context?.fetch(fetchRequest) as! [Student]
        } catch {
            print("Can not get Data")
        }
        return student
    }
    
    // MARK: - DELETE STUDENT DETAILS
    
    internal func deleteData(index:Int) -> [Student]{
        var student = self.getStudentData()
        self.context?.delete(student[index])
        student.remove(at: index)
        do{
            try self.context?.save()
        }
        catch{
            print("Can not delete data")
        }
        return student
    }
    
    internal func editData(object:[String:String], i:Int)  {
        let student = self.getStudentData()
        student[i].name = object["name"]
        student[i].address = object["address"]
        student[i].city = object["city"]
        student[i].mobile = object["mobile"]
        do{
            try self.context?.save()
        }
        catch{
            print("Data is not edited ")
        }
        
        
    }
}

