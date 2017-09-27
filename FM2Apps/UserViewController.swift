//
//  ViewController.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/23/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import PKNetworkActivityController
import ActionKit
import RxSwift

class UserViewController: BaseMapViewController {
    
    private let userPresenter = UserPresenter(userService: UserService())
    
    @IBOutlet var showContentButton: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        userPresenter.attachView(view: self)
//        userPresenter.getUserData()
        
        
//        userPresenter.routePath.asObservable().subscribe(onNext: { route in
//            self.drawRoutePath(routePath: route)
//            
//        }).addDisposableTo(disposeBag)
        
        
        userPresenter.createUserObservable().subscribe(onNext: { user in
            self.drawRoute(route: (user.bus?.route)!)
        }).addDisposableTo(disposeBag)

        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin]
        button.setTitle("Button", for: .normal)
        mapView?.addSubview(button)
        
        button.addControlEvent(.touchUpInside) {
            
            self.performSegue(withIdentifier: "Show_Content", sender: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func unwindToUserViewController(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
    }
}


extension UserViewController: UserView {
    
    func startLoading(){
        NetworkActivityController.sharedController.registerActivity()
        
    }
    func finishLoading(){
        NetworkActivityController.sharedController.deregisterActivity()
        
    }
    func drawRouteOfUser(route: Route){
        self.drawRoute(route: route)
    }
}
