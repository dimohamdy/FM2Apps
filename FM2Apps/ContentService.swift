//
//  ContentService.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/25/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import ObjectMapper
import Alamofire
import RxSwift
import RxAlamofire

class ContentService {
    
    let disposeBag = DisposeBag()

    
    //the service delivers mocked data with a delay
    func getContentData(callBack:@escaping (String) -> Void){
        
        

        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer" + UserPresenter.tokenData!
        ]
        

        RxAlamofire.request(.post, "http://151.236.222.252/mtc/aboutus/aboutUs", encoding: JSONEncoding.default, headers: headers).responseJSON().subscribe(onNext: { response in
            debugPrint(response)
            // Map via ObjectMapper
            let result:ContentResult = Mapper<ContentResult>().map(JSONObject:response.result.value)!
            callBack((result.innerData?.first?.content)!)
        }).addDisposableTo(disposeBag)
        
        
        
        
    }
}
