//
//  ViewController.swift
//  2016-04-28-CloudKit
//
//  Created by Thiago-Bernardes on 4/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit
import CloudKit

struct Student{
    
    let name: String!
    let email: String!
    let photo: String!
    let photoExtension: String!
}

class ViewController: UIViewController {

    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldName: UITextField!
    
    
    
    @IBAction func addNewFriend(sender: AnyObject) {
        
        let container = CKContainer.defaultContainer()
        let publicDatabase = container.publicCloudDatabase
        
        let record = CKRecord(recordType: "Friend")
        record.setObject(txtFldName.text, forKey: "name")
        record.setObject(txtFldEmail.text, forKey: "email")
        record.setObject(NSDate().dateByAddingTimeInterval(-24*60*60*60), forKey: "birthDate")
        
        publicDatabase.saveRecord(record) { (record: CKRecord?, error: NSError?) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print(record?.description)
            }
        }
        
    }
    
    func addStudentsPhoto() {
     
        // Do any additional setup after loading the view, typically from a nib.
        let container = CKContainer.defaultContainer()
        let publicDatabase = container.publicCloudDatabase
        var student = [Student]()
        student.append(Student(
            name: "Thiago",
            email: "thiago@wesley.com",
            photo: "profile", photoExtension:"jpg"))
        
        for dados in student {
            //table
            let ckStudents = CKRecord(recordType: "Students")
            ckStudents.setObject(dados.name, forKey: "name")
            ckStudents.setObject(dados.email, forKey: "email")
            
            // Configurando a foto
            let fileUrl = NSBundle.mainBundle().URLForResource(dados.photo, withExtension: dados.photoExtension)
            let fotoAsset = CKAsset(fileURL: fileUrl!)
            
            ckStudents.setObject(fotoAsset, forKey: "photo")
            
            // Salva no banco de dados
            publicDatabase.saveRecord(ckStudents, completionHandler: { (record, error) in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    print(record?.objectForKey("name") as! String + "Gravado com sucesso")
                }
            })
            
        }
    }
    
    func searchData() {
        
        let container = CKContainer.defaultContainer()
        let publicDatabase = container.publicCloudDatabase
        
        let valor = "Thi"
        let predicate = NSPredicate(format: "name BEGINSWITH '\(valor)'")
        
        let query = CKQuery(recordType: "Students", predicate: predicate)
        
        publicDatabase.performQuery(query, inZoneWithID: nil) { (records, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            } else {
                
                if records?.count > 0 {
                    
                    let ckRecord = records![0]
//                    self.deleteDados(ckRecord)
                    
                    let image = ckRecord.objectForKey("photo") as! CKAsset!
                    
                    if let CKAsset = image {
                        
                        let url: NSURL = CKAsset.fileURL
                        let imageData = NSData(contentsOfURL: url)
                        
                        let myImage : UIImage
                        myImage = UIImage(data: imageData!)!
                        
                        print(myImage)
                    }
                    self.alterarDados(records![0])

                }
                
            }
            
        }
        
    }
    
    func deleteDados(record: CKRecord) {
        
        let container = CKContainer.defaultContainer()
        let publicDatabase = container.publicCloudDatabase
        
        publicDatabase.deleteRecordWithID(record.recordID) { (record, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            } else {
                
                print("Deletado com sucesso")
            }
            
        }
        
    }
    
    func alterarDados(record: CKRecord) {
        let container = CKContainer.defaultContainer()
        let publicDatabase = container.publicCloudDatabase
        
        record.setObject("Nossa", forKey: "name")
        
        publicDatabase.saveRecord(record) { (record, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print("Alterado com sucess")
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addStudentsPhoto()
        searchData()
//        addStudentsPhoto()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

