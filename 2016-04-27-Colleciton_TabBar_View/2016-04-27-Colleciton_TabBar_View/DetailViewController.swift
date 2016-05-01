//
//  DetailViewController.swift
//  2016-04-27-Colleciton_TabBar_View
//
//  Created by Thiago-Bernardes on 4/27/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    var movieItem : (title: String,description: String, relase: String,imageName: String)!
    
    @IBAction func favorite(sender: AnyObject) {
    
        if self.title == "Favoritos" {
            Movies.favoriteMovies.removeAtIndex(Movies.favoriteMovies.indexOf({ (item) -> Bool in
                item == movieItem
            })!)

        } else {
            Movies.favoriteMovies.append(movieItem)

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.title == "Favoritos" {
            favoriteButton.setTitle("❌ Remove", forState: .Normal)
        } else {
            favoriteButton.setTitle("🌟 Favorite", forState: .Normal)
        }
        
        self.lblTitle.text = movieItem.title
        self.lblDescription.text = movieItem.description
        self.lblReleaseDate.text = movieItem.relase
        image.image = UIImage(named: movieItem.imageName)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
