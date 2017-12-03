//
//  UserLevelControl.swift
//  LoginSample
//
//  Created by Tolga Milas on 25/09/2017.
//  Copyright © 2017 Tolga Milas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper


@IBDesignable class UserLevelyedek: UIStackView {
    
    
    @IBInspectable var userId : String?="" {
        didSet {
            getUserLevels(usrId: userId)
        }
    }
    
    private var lvlCulture:String = "Culture"
    private var lvlCulturePoints:Float = 0
    private var lvlSport : String = "Sports"
    private var lvlSportPoints : Float = 0
    private var lvlFun : String = "Fun"
    private var lvlFunPoints : Float = 0
    private var lvlSocial : String = "Social"
    private var lvlSocialPoints : Float = 0
    private var lvlVoyage : String = "Voyage"
    private var lvlVoyagePoints : Float = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        lvlCulture = "Culture"
        lvlCulturePoints = 0
        lvlSport="Sports"
        lvlSportPoints = 0
        lvlFun="Fun"
        lvlFunPoints = 0
        lvlSocial="Sports"
        lvlSocialPoints = 0
        lvlVoyage="Sports"
        lvlVoyagePoints = 0
        
        //getUserLevels()
        //setupBars()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        //getUserLevels()
        //setupBars()
        
    }
    
    private func getUserLevels(usrId : String?)
    {
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
        
        print("tolggasssssszzz")
        
        Alamofire.request("https://www.lifelvls.com/api/UserLevels/GetUserLevels/" + usrId!, method: HTTPMethod.get, headers: headers).responseJSON { response in
            
            if response.error == nil {
                //debugPrint(response)
                let actualData = response.data
                let json = try! JSON(data: actualData!)
                let usrlevelarray:Array? = json.array
                var usrlevel:Dictionary? = usrlevelarray?[0].dictionary
                self.lvlCulturePoints = (usrlevel?["TotalPoint"]?.floatValue)!
                usrlevel = usrlevelarray?[1].dictionary
                self.lvlSportPoints = (usrlevel?["TotalPoint"]?.floatValue)!
                usrlevel = usrlevelarray?[2].dictionary
                self.lvlFunPoints = (usrlevel?["TotalPoint"]?.floatValue)!
                usrlevel = usrlevelarray?[3].dictionary
                self.lvlSocialPoints = (usrlevel?["TotalPoint"]?.floatValue)!
                usrlevel = usrlevelarray?[4].dictionary
                self.lvlVoyagePoints = (usrlevel?["TotalPoint"]?.floatValue)!
                
                debugPrint("tolgammmm")
                debugPrint(self.lvlCulturePoints)
                debugPrint(self.lvlSportPoints)
                
                debugPrint(json)
                self.setupBars()
                
            }
            else
            {
                debugPrint(response.error.debugDescription)
            }
            
            switch response.result {
                
            case .success(let value):
                let json2 = JSON(value)
                debugPrint(json2)
                let xxx:Array? = json2.array
                let yyy:Dictionary? = xxx?[0].dictionary
                debugPrint(yyy?["TotalPoint"]?.intValue)
                debugPrint(yyy?["LevelId"]?.intValue)
                debugPrint(json2)
                
            case .failure(let error):
                debugPrint(error)
            }
            
        }
    }
    
    
    private func setupBars() {
        
        debugPrint("tolgammmm222")
        debugPrint(self.lvlCulturePoints)
        debugPrint(self.lvlSportPoints)
        
        let lbl=UILabel()
        lbl.text=self.lvlCulture
        lbl.font=UIFont(name: lbl.font.fontName, size:12)
        addArrangedSubview(lbl)
        
        let bar=UIProgressView()
        //bar.backgroundColor = UIColor.red
        
        
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.heightAnchor.constraint(equalToConstant: 0).isActive = true
        bar.widthAnchor.constraint(equalToConstant: 0).isActive = true
        
        bar.transform = bar.transform.scaledBy(x: 1, y: 0.30)
        bar.progress=Float(self.lvlCulturePoints / 100.0)
        addArrangedSubview(bar)
        
        let lbl2=UILabel()
        lbl2.text=self.lvlSport
        lbl2.font=UIFont(name: lbl2.font.fontName, size:12)
        addArrangedSubview(lbl2)
        
        
        let bar2=UIProgressView()
        bar2.translatesAutoresizingMaskIntoConstraints = false
        bar2.heightAnchor.constraint(equalToConstant: 0).isActive = true
        bar2.widthAnchor.constraint(equalToConstant: 0).isActive = true
        
        
        bar2.transform = bar2.transform.scaledBy(x: 1, y: 0.30)
        bar2.progress=Float(self.lvlSportPoints / 100.0)
        addArrangedSubview(bar2)
        
        let lbl3=UILabel()
        lbl3.text=self.lvlFun
        lbl3.font=UIFont(name: lbl3.font.fontName, size:12)
        addArrangedSubview(lbl3)
        
        let bar3=UIProgressView()
        //bar.backgroundColor = UIColor.red
        
        
        bar3.translatesAutoresizingMaskIntoConstraints = false
        bar3.heightAnchor.constraint(equalToConstant: 0).isActive = true
        bar3.widthAnchor.constraint(equalToConstant: 0).isActive = true
        
        bar3.transform = bar3.transform.scaledBy(x: 1, y: 0.30)
        bar3.progress=Float(self.lvlFunPoints / 100.0)
        addArrangedSubview(bar3)
        
        let lbl4=UILabel()
        lbl4.text=self.lvlSocial
        lbl4.font=UIFont(name: lbl4.font.fontName, size:12)
        addArrangedSubview(lbl4)
        
        
        let bar4=UIProgressView()
        bar4.translatesAutoresizingMaskIntoConstraints = false
        bar4.heightAnchor.constraint(equalToConstant: 0).isActive = true
        bar4.widthAnchor.constraint(equalToConstant: 0).isActive = true
        
        
        bar4.transform = bar4.transform.scaledBy(x: 1, y: 0.30)
        bar4.progress=Float(self.lvlSocialPoints / 100.0)
        addArrangedSubview(bar4)
        
        let lbl5=UILabel()
        lbl5.text=self.lvlVoyage
        lbl5.font=UIFont(name: lbl5.font.fontName, size:12)
        addArrangedSubview(lbl5)
        
        
        let bar5=UIProgressView()
        bar5.translatesAutoresizingMaskIntoConstraints = false
        bar5.heightAnchor.constraint(equalToConstant: 0).isActive = true
        bar5.widthAnchor.constraint(equalToConstant: 0).isActive = true
        
        
        bar5.transform = bar5.transform.scaledBy(x: 1, y: 0.30)
        bar5.progress=Float(self.lvlVoyagePoints / 100.0)
        addArrangedSubview(bar5)
        
        /*let button = UIButton()
         button.backgroundColor = UIColor.red
         
         // Add constraints
         button.translatesAutoresizingMaskIntoConstraints = false
         button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
         button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
         
         
         // Add the button to the stack
         addArrangedSubview(button)
         
         let button2 = UIButton()
         button2.backgroundColor = UIColor.red
         
         // Add constraints
         button2.translatesAutoresizingMaskIntoConstraints = false
         button2.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
         button2.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
         
         
         // Add the button to the stack
         addArrangedSubview(button2)*/
        
        
    }
}

