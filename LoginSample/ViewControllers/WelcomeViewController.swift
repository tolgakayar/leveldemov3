//
//  LoginViewController.swift
//  LoginSample
//
//  Created by Tolga Milas on 19/06/2017.
//  Copyright © 2017 Tolga Milas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class WelcomeViewController: UIViewController {
    
    
    func checkLogonState() {
        
        var retrievedString: String? = KeychainWrapper.standard.string(forKey: "accessToken")
        //retrievedString = nil
        if retrievedString != nil
        {
            debugPrint("tolgamilassss222")
            debugPrint(retrievedString)
            
            /*let controllerId="MainPage"
            
            let storyboard:UIStoryboard=UIStoryboard(name:"Main",bundle:nil)
            
            let mainPageViewController:UIViewController=storyboard.instantiateViewController(withIdentifier: controllerId) as UIViewController
            */
            //self.present(mainPageViewController, animated: true, completion: nil)
            
            OperationQueue.main.addOperation {
                /*let cont = MainViewController()
                self.navigationController?.pushViewController(cont, animated: true) */
 
                let controllerId="MainPage"
                 
                 let storyboard:UIStoryboard=UIStoryboard(name:"Main",bundle:nil)
                 
                 let mainPageViewController:UIViewController=storyboard.instantiateViewController(withIdentifier: controllerId) as UIViewController
                
                self.present(mainPageViewController, animated: true, completion: nil)
                
            }
            
        }
        else
        {
            OperationQueue.main.addOperation {
                /*let cont = MainViewController()
                 self.navigationController?.pushViewController(cont, animated: true) */
                
                let controllerId="AuthNav"
                
                let storyboard:UIStoryboard=UIStoryboard(name:"Auth",bundle:nil)
                
                let authNavViewController:UIViewController=storyboard.instantiateViewController(withIdentifier: controllerId) as UIViewController
                
                self.present(authNavViewController, animated: true, completion: nil)
                
            }
        }

        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLogonState()
    }

}
