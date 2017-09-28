//
//  UserPresenter.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/24/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import RxSwift

class UserPresenter:BasePresenter {
    private let userService:UserService
    private var userData:User?
    static var tokenData:String?

    var routePath = Variable<[DropoffLocation]>([])
    

    
    init(userService:UserService){
        self.userService = userService
        
        super.init()
        self.loading = false
        _ =  userService.loading.asObservable().subscribe(onNext: {
            loadingValue in
            self.loading  = loadingValue
            
        })
    }
    

    func createUserObservable() -> Observable<User> {
        
        return Observable<User>.create({ (observer) -> Disposable in
            


            
            self.userService.createUserServiceObservable().subscribe(onNext: { innerData in
                UserPresenter.tokenData = innerData.token

                observer.onNext(innerData.user!)

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



