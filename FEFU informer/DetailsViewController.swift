//
//  DetailsViewController.swift
//  FEFU informer
//
//  Created by Илья on 31.10.15.
//  Copyright © 2015 AwakeGD. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController{
    @IBOutlet weak var descriptionText: UILabel!
    var image = UIImage()
    var text = String()
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = self.image
        self.descriptionText.text = self.text
    }
    
}