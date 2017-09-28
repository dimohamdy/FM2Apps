//
//  SingletonBanner.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/25/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import BRYXBanner

class SingletonBanner: NSObject {
    static let sharedInstance =  SingletonBanner()
    
    var banner:Banner = Banner()
    
    override init() {
        super.init()
    }
    func setTitle(_ message: String) {
        self.banner.dismiss()
        
        let green = UIColor.darkGray //UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha:1.000)
        self.banner = Banner(title: message, backgroundColor: green)
        self.banner.position = .bottom
        self.banner.backgroundColor = green
        self.banner.show(duration: 2.0)
        
    }
}
