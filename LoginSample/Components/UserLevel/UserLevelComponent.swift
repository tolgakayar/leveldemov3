//
//  UserLevelComponent.swift
//  LoginSample
//
//  Created by Tolga Milas on 09/11/2017.
//  Copyright © 2017 Tolga Milas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftKeychainWrapper
import SwiftyJSON


class UserLevelComponent
{
    
    public func getLevels(usrId : String?, completion: @escaping (JSON) ->())->Void
    {

        var reqresult : Bool = false
        var resjson : JSON = JSON()
        var retrievedString: String? = KeychainWrapper.standard.string(forKey: "accessToken")
        //var userName: String? = KeychainWrapper.standard.string(forKey: "userName")
        //var userId: String? = KeychainWrapper.standard.string(forKey: "userId")
        
        if retrievedString == nil
        {
            retrievedString = ""
        }
        
        /*if userName == nil
         {
         userName = ""
         }*/
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Accept": "application/json",
            "Authorization": "Bearer " + retrievedString!
        ]
        
        let serverReq=ClSrvIntegLevelComp()
        serverReq.setSecureTargetUrl(securetargeturl: "https://www.lifelvls.com/api/UserLevels/GetUserLevels/" + usrId!)
        
        let serverResp = serverReq.sendToServer(token: "", commmethod: HTTPMethod.get, commheaders: headers)
        serverResp.responseJSON {response in
            
            switch response.result {
                
            case .success(let value):
                let json2 = JSON(value)
                completion(json2)
                return
            case .failure(let error):
                completion(JSON.null)
                debugPrint(error)
                return
            }
            
        }
        
        
        
    /*    let serverResp=serverReq.sendToServer(token: "", commmethod: HTTPMethod.get, commheaders: headers)
         {result in
            
            if result.error == nil {
                debugPrint("tolgapoff")
                debugPrint(result)
                var usrlevelarray:Array<AnyObject> = Array<AnyObject>()
                usrlevelarray = result.array! as Array<AnyObject>
                resjson = result
                //var usrlevel:Dictionary = usrlevelarray[1] as! Dictionary<String, Float> as Dictionary
                //self.lvlCulturePoints = (usrlevel?["TotalPoint"]?.floatValue)!
                /*usrlevel = usrlevelarray?[1].dictionary
                //self.lvlSportPoints = (usrlevel?["TotalPoint"]?.floatValue)!
                usrlevel = usrlevelarray?[2].dictionary
                //self.lvlFunPoints = (usrlevel?["TotalPoint"]?.floatValue)!
                usrlevel = usrlevelarray?[3].dictionary
                //self.lvlSocialPoints = (usrlevel?["TotalPoint"]?.floatValue)!
                usrlevel = usrlevelarray?[4].dictionary
                //self.lvlVoyagePoints = (usrlevel?["TotalPoint"]?.floatValue)!*/
                
                debugPrint("tolgammmm")
                //debugPrint(self.lvlCulturePoints)
                //debugPrint(self.lvlSportPoints)
                
                //self.setupBars()
                
                reqresult = true
                return


                
            }
            else
            {
                debugPrint(result.error.debugDescription)
                reqresult = false
                return

            }
        }
        return resjson*/

    }
}
