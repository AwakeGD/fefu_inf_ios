//
//  ViewController.swift
//  FEFU informer
//
//  Created by Илья on 26.10.15.
//  Copyright © 2015 AwakeGD. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://31.131.24.188:8080/").responseString() {
            data in
            print(data)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

