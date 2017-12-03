
import UIKit
public struct ConnectionSettings {
    
    static var clientId = "yA0ac1klHaXYDJ5HPHN4sVVxpX1Vem1A"
    static var clientSecret = "zJA8WNmmxe4UXR0G"
    static var apiBaseUrl = "http://developerdave-test.apigee.net"
    
    public static func apiURLWithPathComponents(components: String) -> NSURL {
        let baseUrl = NSURL(string: ConnectionSettings.apiBaseUrl)
        let APIUrl = NSURL(string: components, relativeTo: baseUrl! as URL)
        
        return APIUrl!
    }
}
