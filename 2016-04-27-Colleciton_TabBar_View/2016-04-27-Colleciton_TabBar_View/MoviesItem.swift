//
//  MoviesItem.swift
//  2016-04-27-Colleciton_TabBar_View
//
//  Created by Thiago-Bernardes on 4/27/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit

class MoviesItem: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    var movieItem : (title: String,description: String, relase: String,imageName: String)! {
        didSet {
            image.image = UIImage(named: movieItem.3)
            lblTitle.text = movieItem.0
        }
        
    }
}
