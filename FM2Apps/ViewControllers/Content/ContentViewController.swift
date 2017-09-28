//
//  ContentViewController.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/25/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import PKNetworkActivityController

class ContentViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    private let contentPresenter = ContentPresenter(contentService: ContentService())

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        contentPresenter.attachView(view: self)
//        contentPresenter.getContentData()

            
          _ =  contentPresenter.createContentObservable().subscribe(onNext: { htmlData in
                self.webView.loadHTMLString(htmlData, baseURL: nil)

            })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension ContentViewController: ContentView {
//    
//    func startLoading(){
//        NetworkActivityController.sharedController.registerActivity()
//        
//    }
//    func finishLoading(){
//        NetworkActivityController.sharedController.deregisterActivity()
//        
//    }
//    func renderHTMLOfData(htmlData: String){
//        webView.loadHTMLString(htmlData, baseURL: nil)
//    }
//}
