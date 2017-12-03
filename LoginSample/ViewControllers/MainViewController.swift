//
//  MainViewController.swift
//  LoginSample
//
//  Created by Tolga Milas on 27/08/2017.
//  Copyright © 2017 Tolga Milas. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper


class MainViewController: UIViewController {

    @IBOutlet weak var userLevelControl: UserLevelControl!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        var userId: String? = KeychainWrapper.standard.string(forKey: "userId")
        userLevelControl.userId = userId

    }

 }
