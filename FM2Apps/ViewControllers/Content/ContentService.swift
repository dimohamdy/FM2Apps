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

    var loading:Variable<Bool> = Variable(false)


    func createContentServiceObservable() -> Observable<String> {
        
        return Observable<String>.create({ (observer) -> Disposable in
            
            self.loading.value = true

            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer" + UserPresenter.tokenData!
            ]
            

            RxAlamofire.request(.post, "http://151.236.222.252/mtc/aboutus/aboutUs", encoding: JSONEncoding.default, headers: headers).responseJSON().subscribe(onNext: { response in
                //            debugPrint(response)
                // Map via ObjectMapper
                let result:ContentResult = Mapper<ContentResult>().map(JSONObject:response.result.value)!
                if result.status == true{
                    observer.onNext((result.innerData?.first?.content)!)
 
                }else{
                    observer.onError(response.error!)

                }
                self.loading.value = false

                observer.onCompleted()

//                callBack((result.innerData?.first?.content)!)
            }).addDisposableTo(self.disposeBag)
            

            //Return an AnonymousDisposable
            return Disposables.create(with: {
                //Cancel the connection if disposed
            })
        })
    }
}
