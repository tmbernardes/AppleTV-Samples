//
//  ViewController+CollectionViewDataSource.swift
//  2016-04-29-CloudkitChallenge
//
//  Created by Thiago-Bernardes on 4/30/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return developers.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCellWithReuseIdentifier("DeveloperCell", forIndexPath: indexPath) as! CollectionItemCollectionViewCell
        item.developerItem = developers[indexPath.item]
        
        return item
        
    }
}
