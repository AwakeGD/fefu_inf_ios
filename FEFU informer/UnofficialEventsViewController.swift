//
//  UnofficialEventsViewController.swift
//  FEFU informer
//
//  Created by Илья on 02.11.15.
//  Copyright © 2015 AwakeGD. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import Haneke

class UnofficialEventsViewController: UICollectionViewController {
    
    @IBOutlet weak var officialEventsCollectionView: UICollectionView!
    
    var titleArray = [String]()
    var descriptionArray = [String]()
    var imageArray = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.officialEventsCollectionView.backgroundColor = UIColor.whiteColor()
        Alamofire.request(.GET, "http://31.131.24.188:8080/newsLine/0&u", parameters: nil)
            .responseJSON { response in
                if let JSON = response.result.value{
                    for object in JSON as! [AnyObject]{
                        self.titleArray.append(object["title"] as! String)
                        self.descriptionArray.append(object["description"] as! String)
                        let image =  UIImage(data: NSData(contentsOfURL: NSURL(string: object["img_src"] as! String)!)!)
                        self.imageArray.append(image!)
                    }
                    self.officialEventsCollectionView.reloadData()
                }
                
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
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
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
