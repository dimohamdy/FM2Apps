//
//  BasePresenter.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/28/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import PKNetworkActivityController

class BasePresenter: NSObject {
    
    private var _loading : Bool?
    var loading: Bool?{
        
        set(newLoading){
            if newLoading == true{
                startLoading()
            }else{
                finishLoading()
            }
            _loading = newLoading
            
        }
        
        get{
            return _loading
        }
    }
    
    func startLoading(){
        NetworkActivityController.sharedController.registerActivity()
        
    }
    func finishLoading(){
        NetworkActivityController.sharedController.deregisterActivity()
        
    }
    
}
