//
//  RegistrationConfirmViewController
//  FEFU informer
//
//  Created by Илья on 05.11.15.
//  Copyright © 2015 AwakeGD. All rights reserved.
//

import UIKit
import Alamofire

class RegistrationConfirmViewController: UIViewController {
    
    var phoneNumber =  String()
    
    
    @IBAction func submitRegistrationConfirm(sender: AnyObject) {
        let url = "http://31.131.24.188:8080/validateUsers"
        let parameters = [
            "phoneCode": confirmCodeInput,
            "phoneNumber": phoneNumber
        ]
        
        Alamofire.request(.POST, url, parameters: parameters, encoding: .JSON)
        
    }
    
    @IBOutlet weak var confirmCodeInput: UITextField!
}
