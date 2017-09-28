//
//  UserPresenter.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/24/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import RxSwift

class UserPresenter {
    private let userService:UserService
    weak private var userView : UserView?
    private var userData:User?
    static var tokenData:String?

    var routePath = Variable<[DropoffLocation]>([])
    

    
    init(userService:UserService){
        self.userService = userService
        

    }
    
    func attachView(view:UserView){
        userView = view
    }
    
    func detachView() {
        userView = nil
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


//    func getUserData(){
//        self.userView?.startLoading()
//
//        userService.getUserData { user,token in
//            UserPresenter.tokenData = token
//            self.userData = user
//            self.routePath.value = (user.bus?.route?.routePath)!
//            self.userView?.finishLoading()
//            //self.userView?.drawRouteOfUser(route: (user.bus?.route)!)
////            self.userView?.setUserData(user: user)
//
//        }
//    }
}


protocol UserView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func drawRouteOfUser(route: Route)

}
