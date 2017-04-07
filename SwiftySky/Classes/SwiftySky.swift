//
//  SwiftySky.swift
//  Pods
//
//  Created by Bhat, Nanda on 4/5/17.
//
//

import Foundation
import AlamofireObjectMapper
import Alamofire

public class SwiftySky {
    
    var KEY = ""
    var LAT = ""
    var LONG = ""
    let URL = "https://api.darksky.net/forecast/"
    
    
    public init(key: String, latitude: String, longitude: String){
        self.KEY = key
        self.LAT = latitude
        self.LONG = longitude
    }
    
    public func getWeatherUpdate() -> String {
        return "SUCCESS"
    }
    
    public func forecast() {
        Alamofire.request(URL).responseObject { (response: DataResponse<DarkSky>) in {
            
            let weatherResponse = response.result.value
            print(weatherResponse?.latitude)
            
            }
        }
    }
}
