//
//  LoginViewController.swift
//  LoginSample
//
//  Created by Tolga Milas on 19/06/2017.
//  Copyright © 2017 Tolga Milas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var forgotPwdButton: UIButton!
    
    
    @IBAction func loginBtnPress(_ sender: Any) {
        
        
        let req = Authorization(usrId : "")
        req.login(usrName: loginTextField.text!, usrPwd: passwordTextField.text!)
        
        
        let alertController = UIAlertController(title: "test", message: "message", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            // perhaps use action.title here
        })
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func registerBtnPress(_ sender: UIButton) {
        
                
        /*let controllerId="Register"
        
        let storyboard:UIStoryboard=UIStoryboard(name:"Auth",bundle:nil)
        
        let registerViewController:UIViewController=storyboard.instantiateViewController(withIdentifier: controllerId) as UIViewController
        
        self.present(registerViewController, animated: true, completion: nil)*/

    }
    
    
    @IBAction func forgotPwdBtnPress(_ sender: UIButton) {
        
        /*let controllerId="ForgotPwd"
        
        let storyboard:UIStoryboard=UIStoryboard(name:"Auth",bundle:nil)
        
        let forgotPwdViewController:UIViewController=storyboard.instantiateViewController(withIdentifier: controllerId) as UIViewController
        
        //self.present(forgotPwdViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(forgotPwdViewController, animated:true)*/

        
        
        
        
        
        //var rootViewController = self.window!.rootViewController as UINavigationController

        //let loginVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "ForgotPwd") as! ForgotPwdViewController
        //var navigationController = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController

        //self.navigationController?.pushViewController(loginVC, animated: true)
        
        //navigationController.pushViewController(loginVC, animated: true)

        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
