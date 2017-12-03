//
//  Authorization.swift
//  LoginSample
//
//  Created by Tolga Milas on 03/09/2017.
//  Copyright © 2017 Tolga Milas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftKeychainWrapper
import SwiftyJSON




class Authorization

{
    var userId : String = ""
    var accessToken : String = ""
    var refreshToken : String = ""
    var userName : String = ""
    var firstName : String = ""
    var lastName : String = ""
    var lastLoginDate : String
    
    init(usrId : String) {
        userId = usrId
        accessToken = ""
        refreshToken = ""
        userName = ""
        firstName = ""
        lastName = ""
        lastLoginDate = ""
        
        
    }
    
    
    func setUserId(userId2:String)
    {
        userId = userId2
    }
    
    public func login(usrName : String, usrPwd : String) -> Bool
    {
        var reqresult : Bool = false
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Accept": "application/json"
        ]
        
        /*let details = [
            "username": "tolgakayar@yahoo.com",
            "password": "Goligo123;",
            "grant_type": "password"
        ]*/

        let details = [
            "username": usrName,
            "password": usrPwd,
            "grant_type": "password"
        ]
        
        let serverReq=ClSrvIntegAuth()
        serverReq.setSecureTargetUrl(securetargeturl: "https://www.lifelvls.com/Token")
        let serverResp=serverReq.sendToServer(token: "", commmethod: HTTPMethod.post, commheaders: headers, commdetails: details)
        serverResp.responseJSON {response in
        
        if response.error == nil {
            //debugPrint(response)
            let actualData = response.data
            let json = try! JSON(data: actualData!)
            //debugPrint(json)
            let access_token = (json["access_token"].stringValue)
            if access_token != "" {
                debugPrint("login success")
                debugPrint(json["access_token"].stringValue)
                debugPrint(json[".expires"].stringValue)
                
                let userName=json["userName"].stringValue
                let userId=json["userId"].stringValue
                
                let saveSuccessful: Bool = KeychainWrapper.standard.set(json["access_token"].stringValue, forKey: "accessToken")
                
                let saveSuccessful1: Bool = KeychainWrapper.standard.set(json["userName"].stringValue, forKey: "userName")
                
                let saveSuccessful2: Bool = KeychainWrapper.standard.set(json["userId"].stringValue, forKey: "userId")
                
                reqresult = true

            }
            else
            {
                debugPrint("login error")
                reqresult = false
            }
            
        }
        else
        {
            debugPrint(response.error.debugDescription)
            reqresult = false
        }
    }
    
        return reqresult
    }

    public func register() ->Bool
    {
        var reqresult : Bool = false

        let details = [
            "email": "tolga_milas@hotmail.com",
            "password": "Goligo123;",
            "confirmPassword": "Goligo123;",
            "firstName" : "Tolga",
            "lastName" : "Milas"
        ]
        
        
        let serverReq=ClSrvIntegAuth()
        serverReq.setSecureTargetUrl(securetargeturl: "https://www.lifelvls.com/api/Account/Register")
        let serverResp=serverReq.sendToServer(token: "", commmethod: HTTPMethod.post, commheaders: HTTPHeaders(), commdetails: details)
        serverResp.responseJSON {response in
        
            if response.error == nil {
                //debugPrint(response)
                let actualData = response.data
                let json = try! JSON(data: actualData!)
                debugPrint(json)
                reqresult = true
            
            }
            else
            {
                debugPrint(response.error.debugDescription)
                reqresult = false

            }
        }
        
        return reqresult
    }
    
    
    public func forgotPwd(usrEmail : String)->Bool
    {
        var reqresult : Bool = false

        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Accept": "application/json"
        ]
        
        
        let details = [
            "email": usrEmail
        ]
        
        
        let serverReq=ClSrvIntegAuth()
        serverReq.setSecureTargetUrl(securetargeturl: "https://www.lifelvls.com/api/Account/ForgotPassword")
        let serverResp=serverReq.sendToServer(token: "", commmethod: HTTPMethod.post, commheaders: headers, commdetails: details)
        serverResp.responseJSON {response in
            
            if response.error == nil {
                //debugPrint(response)
                let actualData = response.data
                let json = try! JSON(data: actualData!)
                debugPrint(json)
                reqresult = true
                
            }
            else
            {
                debugPrint(response.error.debugDescription)
                reqresult = false
                
            }
        }
        
        return reqresult
        
    }
}
