//
//  ContentPresenter.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/25/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit

class ContentPresenter {
    private let contentService:ContentService
    weak private var contentView : ContentView?
    private var contentData:String?
//    private var tokenData:String?
    
    init(contentService:ContentService){
        self.contentService = contentService
    }
    
    func attachView(view:ContentView){
        contentView = view
    }
    
    func detachView() {
        contentView = nil
    }
    
    func getContentData(){
        self.contentView?.startLoading()
        
        contentService.getContentData { content in
            self.contentData = content
            self.contentView?.finishLoading()
            self.contentView?.renderHTMLOfData(htmlData: content)
            //            self.userView?.setUserData(user: user)
            
        }
    }
}


protocol ContentView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func renderHTMLOfData(htmlData: String)
    
}
