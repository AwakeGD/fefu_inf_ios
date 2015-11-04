//
//  RegistrationViewController.swift
//  FEFU informer
//
//  Created by Илья on 04.11.15.
//  Copyright © 2015 AwakeGD. All rights reserved.
//
import UIKit
import Alamofire

class RegistrationViewController: UIViewController {
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var telephoneInput: UITextField!
    @IBOutlet weak var secondNameInput: UITextField!
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var passwordConfirmInput: UITextField!
    
    @IBAction func registrationSubmit(sender: UIButton) {
        
        let url = "http://31.131.24.188:8080/registerUsers"
        
        let parameters = [
            "firstName": firstNameInput,
            "lastName": secondNameInput,
            "phoneNumber": telephoneInput,
            "password": passwordInput,
            "fileUpload": nil
        ]
        
        Alamofire.request(.POST, url, parameters: parameters, encoding: .JSON)
        self.performSegueWithIdentifier("confirmSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "confirmSegue" {
            let vc = segue.destinationViewController as! RegistrationConfirmViewController
            vc.phoneNumber = self.telephoneInput.text!
        }
    }

}