//
//  ContentPresenter.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/25/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import RxSwift

class ContentPresenter:BasePresenter {
    private let contentService:ContentService
//    weak private var contentView : ContentView?
    private var contentData:String?
//    private var tokenData:String?
    
    init(contentService:ContentService){
        self.contentService = contentService
        super.init()
        self.loading = false
      _ =  contentService.loading.asObservable().subscribe(onNext: {
            loadingValue in
            self.loading  = loadingValue
        
        })

    }
    

    
    
    func createContentObservable() -> Observable<String> {
        
        return Observable<String>.create({ (observer) -> Disposable in

            
            self.contentService.createContentServiceObservable().subscribe(onNext: { contentData in
                observer.onNext(contentData)
                
            }, onError: { error in
                observer.onError(error)
            }, onCompleted: {
                //Complete the sequence
                observer.onCompleted()
            }, onDisposed: {
                //Return an AnonymousDisposable
            })
            
            
        })
    }

}



