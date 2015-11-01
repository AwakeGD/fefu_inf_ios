//
//  File.swift
//  FEFU informer
//
//  Created by Илья on 29.10.15.
//  Copyright © 2015 AwakeGD. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireJsonToObjects


class OfficialEventsViewController: UICollectionViewController {
    
    @IBOutlet weak var officialEventsCollectionView: UICollectionView!
    
    var titleArray = [String]()
    var descriptionArray = [String]()
    var test = [UIImage(named: "image"), UIImage(named: "image"), UIImage(named: "image"), UIImage(named: "image")]
    var imageArray = [UIImage]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.officialEventsCollectionView.backgroundColor = UIColor.whiteColor()

        let semaphore = dispatch_semaphore_create(0)
        Alamofire.request(.GET, "http://31.131.24.188:8080/newsLine", parameters: ["foo": "bar"])
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    for object in JSON as! [AnyObject]{
                        self.titleArray.append(object["title"] as! String)
                        self.descriptionArray.append(object["description"] as! String)
                        
                        
                        
                        let image =  UIImage(data: NSData(contentsOfURL: NSURL(string: object["img_src"] as! String)!)!)
                        self.imageArray.append(image!)
                            
                        
                        
                        
                    }

                }
                dispatch_semaphore_signal(semaphore)
        }
        
        while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
        }
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.titleArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("officialEventCell", forIndexPath: indexPath) as! OfficialEventsViewCell
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        
        cell.eventTitle?.text = self.titleArray[indexPath.row]
        
        cell.eventDescription?.text = self.descriptionArray[indexPath.row]
        cell.eventDescription?.editable = false
        
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        cell.layer.borderWidth = 1
        
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        print(indexPath.row)
        self.performSegueWithIdentifier("showDetails", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetails"{
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            let vc = segue.destinationViewController as! DetailsViewController
            vc.image = self.imageArray[indexPath.row]
            vc.text = self.descriptionArray[indexPath.row]
            vc.title = self.titleArray[indexPath.row]

        }
    }
    
    
    
    
    
}
