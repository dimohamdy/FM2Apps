//
//  UserService.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/24/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

//import Alamofire
import ObjectMapper
import Alamofire
import RxSwift
import RxAlamofire

class UserService {
    
    let disposeBag = DisposeBag()

    //the service delivers mocked data with a delay
    func getUserData(callBack:@escaping (User,String) -> Void){

        
        let body: Parameters = [
            "name":"Hend",
            "password":"123456"
        ]

        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]

        
        RxAlamofire.request(.post, "http://151.236.222.252/mtc/account/checkCredentials", parameters: body, encoding: JSONEncoding.default, headers: headers).responseJSON().subscribe(onNext: { response in
            debugPrint(response)
            // Map via ObjectMapper
            let result:Result = Mapper<Result>().map(JSONObject:response.result.value)!
            callBack((result.innerData?.user)!,(result.innerData?.token)!)
        }).addDisposableTo(disposeBag)
        

        
    }
    
}
