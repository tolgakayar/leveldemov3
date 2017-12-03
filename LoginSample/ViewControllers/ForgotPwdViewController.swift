//
//  ForgotPwdViewController.swift
//  ForgotPwd
//
//  Created by Tolga Milas on 10/09/2017.
//  Copyright © 2017 Tolga Milas. All rights reserved.
//

import UIKit


class ForgotPwdViewController: UIViewController {
    
    
    @IBOutlet weak var usrEmailTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    @IBAction func submitBtnPress(_ sender: UIButton) {
        
/*        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Accept": "application/json"
        ]
       
        
        let details = [
            "email": "tolga_milas@hotmail.com"
        ]
        
        print("tolggassssss222")
        
        Alamofire.request("https://www.lifelvls.com/api/Account/ForgotPassword", method: HTTPMethod.post, parameters: details, headers: headers).responseJSON { response in
            
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
        req.forgotPwd(usrEmail: usrEmailTextField.text!)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
