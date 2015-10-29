//
//  File.swift
//  FEFU informer
//
//  Created by Илья on 29.10.15.
//  Copyright © 2015 AwakeGD. All rights reserved.
//

import UIKit

class OfficialEventsViewController: UICollectionViewController {
    
    @IBOutlet weak var officialEventsCollectionView: UICollectionView!
    
    let appleProducts = ["iPhone", "Apple Watch", "Mac", "iPad"]
    let imageArray = [UIImage(named: "image"), UIImage(named: "image"), UIImage(named: "image"), UIImage(named: "image")]
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.appleProducts.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("officialEventCell", forIndexPath: indexPath) as! OfficialEventsViewCell
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        
        cell.eventTitle?.text = self.appleProducts[indexPath.row]
        
        cell.eventDescription?.text = self.appleProducts[indexPath.row]
        
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        print("item selected")
    }
    
    
    
    
    
    
}
