//
//  ViewController.swift
//  2016-04-29-CloudkitChallenge
//
//  Created by Thiago-Bernardes on 4/30/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var developers = [CKRecord]()
    
    @IBAction func textFieldEndEditing(sender: UITextField) {
        
        searchData(sender.text)
        
    }
    
    func searchData(searchString: String!) {
        
        let container = CKContainer.defaultContainer()
        let publicDatabase = container.publicCloudDatabase
        
        let predicate = NSPredicate(format: "Name BEGINSWITH %@",searchString)
        
        let query = CKQuery(recordType: "Developers", predicate: predicate)
        
        publicDatabase.performQuery(query, inZoneWithID: nil) { (records, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            } else {
                
                if records?.count > 0 {
                    
                    self.developers = records!
                    dispatch_async(dispatch_get_main_queue()) {
                        self.collectionView.reloadData()
                    }
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchData("")

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

