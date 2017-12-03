//
//  ClSrcIntegBase.swift
//
//  Created by Tolga Milas on 03/09/2017.
//  Copyright © 2017 Tolga Milas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ClSrvIntegBase
    
{
    // tolga was here
    var targetUrl : String = ""
    var secureTargetUrl : String = ""
    var commType : String = ""
    var token : String = ""
    
    init() {
        targetUrl = ""
        secureTargetUrl = ""
        commType = ""
        token = ""
    }
    
    public func setTargetUrl(targeturl : String)
    {
        targetUrl = targeturl
    }
    
    public func setSecureTargetUrl(securetargeturl : String)
    {
        secureTargetUrl = securetargeturl
    }
    
    public func sendToServer(token : String, commmethod : HTTPMethod, commheaders : HTTPHeaders, commdetails : Parameters) -> DataRequest
    {
        
        return Alamofire.request(secureTargetUrl, method : commmethod, parameters : commdetails, headers : commheaders)
    }
 
    public func sendToServer(token : String, commmethod : HTTPMethod, commheaders : HTTPHeaders) -> DataRequest
    {
        debugPrint("send1")
        return Alamofire.request(secureTargetUrl, method : commmethod, headers : commheaders)
    }
    
}
