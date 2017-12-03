//
//  ClSrcIntegAuth.swift
//
//  Created by Tolga Milas on 03/09/2017.
//  Copyright © 2017 Tolga Milas. All rights reserved.
//

import UIKit
import Alamofire

class ClSrvIntegAuth : ClSrvIntegBase
    
{
    
    override func sendToServer(token : String, commmethod : HTTPMethod, commheaders : HTTPHeaders, commdetails : Parameters) -> DataRequest
    {
        
        return super.sendToServer(token: secureTargetUrl, commmethod : commmethod, commheaders : commheaders, commdetails : commdetails)
    }
    
}
