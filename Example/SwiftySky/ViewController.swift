//
//  ViewController.swift
//  SwiftySky
//
//  Created by n89nanda on 04/05/2017.
//  Copyright (c) 2017 n89nanda. All rights reserved.
//

import UIKit
import SwiftySky

class ViewController: UIViewController {

    let KEY = "6871b5e134e906053450e78121595c95"
    let LAT = "37.8267"
    let LONG = "-122.4233"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let a = SwiftySky(key: KEY, latitude: LAT, longitude: LONG)
        print(a.getWeatherUpdate())
        //let WeatherResponse = SwiftySky().getCurrentWeather(key: KEY, latitude: LAT, longitude: LONG)
        //print (WeatherResponse)
    }

}

