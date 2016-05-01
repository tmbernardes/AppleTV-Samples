//
//  CollectionItemCollectionViewCell.swift
//  2016-04-29-CloudkitChallenge
//
//  Created by Thiago-Bernardes on 4/30/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit
import CloudKit

class CollectionItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    
    var developerItem: CKRecord! {
        didSet {
            
            if let image = developerItem.objectForKey("Photo") as? CKAsset,
                let name = (developerItem.objectForKey("Name") as? String),
                let surname = (developerItem.objectForKey("Surname") as? String),
                let email = developerItem.objectForKey("Email") as? String {
                
                let url: NSURL = image.fileURL
                let imageData = NSData(contentsOfURL: url)
                
                let myImage : UIImage
                myImage = UIImage(data: imageData!)!
                photo.image = myImage
                
                lblName.text  =  name + " "  + surname
                lblEmail.text = email
                
                
            }
            
            
        }
    }
}
