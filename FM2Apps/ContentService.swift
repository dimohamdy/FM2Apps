//
//  ContentService.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/25/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ContentService {
    //the service delivers mocked data with a delay
    func getContentData(callBack:@escaping (String) -> Void){
        
        

        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer" + UserPresenter.tokenData!
        ]
        
        
        
        Alamofire.request("http://151.236.222.252/mtc/aboutus/aboutUs", method: .post, headers: headers).responseJSON { response in
            debugPrint(response)
            // Map via ObjectMapper
            let result:ContentResult = Mapper<ContentResult>().map(JSONObject:response.result.value)!
            callBack((result.innerData?.first?.content)!)
            
        }
        
        
        
        
        
    }
}
