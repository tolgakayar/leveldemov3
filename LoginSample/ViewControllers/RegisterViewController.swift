//
//  RegisterViewController.swift
//  LoginSample
//
//  Created by Tolga Milas on 10/09/2017.
//  Copyright © 2017 Tolga Milas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper


class RegisterViewController: UIViewController {
    
    public struct Person {
        public let FirstName:String
        public let LastName:String
    }
    
    @IBOutlet var usrNameTextField: [UITextField]!
    @IBOutlet weak var usrLastNameTextField: UITextField!
    @IBOutlet var usrFirstNameTextField: [UITextField]!
    @IBOutlet weak var submitButton: UIButton!
 
    @IBAction func submitBtnPress(_ sender: UIButton) {
        debugPrint("submit pressed")

/*        let person = Person(FirstName : "aaa", LastName : "bbb")
        
        //let payload: Data = try JSONEncoder().encode(person)
        
        var retrievedString: String? = KeychainWrapper.standard.string(forKey: "accessToken")
        if retrievedString == nil
        {
            retrievedString = ""
        }
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Accept": "application/json",
            "Authorization": "Bearer " + retrievedString!
        ]
        
        let details = [
            "username": "tolgakayar@yahoo.com",
            "password": "Goligo123;",
            "grant_type": "password"
        ]
        
        print("tolggassssss")
        
        Alamofire.request("https://www.lifelvls.com/api/userprofiles/Create", method: HTTPMethod.post, parameters: details , headers: headers).responseJSON { response in
            
            if response.error == nil {
                //debugPrint(response)
                let actualData = response.data
                let json = try! JSON(data: actualData!)
                debugPrint(json)
                
            }
            else
            {
                debugPrint(response.error.debugDescription)
            }
        }
*/
      
 /*       let details = [
            "email": "tolga_milas@hotmail.com",
            "password": "Goligo123;",
            "confirmPassword": "Goligo123;",
            "firstName" : "Tolga",
            "lastName" : "Milas"
        ]
        
        print("tolggassssss")
        
        Alamofire.request("https://www.lifelvls.com/api/Account/Register", method: HTTPMethod.post, parameters: details).responseJSON { response in
            
            if response.error == nil {
                //debugPrint(response)
                let actualData = response.data
                let json = try! JSON(data: actualData!)
                debugPrint(json)
                
            }
            else
            {
                debugPrint(response.error.debugDescription)
            }
        }*/
        
        
        let req = Authorization(usrId : "")
        req.register()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
