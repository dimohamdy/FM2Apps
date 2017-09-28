//
//  BaseMapViewController.swift
//  FM2Apps
//
//  Created by BinaryBoy on 9/24/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import GoogleMaps
import Reachability

class BaseMapViewController: UIViewController {
    
    var mapView:GMSMapView? = nil
    //declare this property where it won't go out of scope relative to your listener
    private let reachability  = Reachability(hostname: "google.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupReachability()
    }
    
    func setupReachability() {
        
        reachability?.whenReachable = { reachability in
            
            SingletonBanner.sharedInstance.setTitle("Have internet connnection")
            SingletonBanner.sharedInstance.banner.dismiss()
        }
        reachability?.whenUnreachable = { _ in
            print("Not reachable")
            SingletonBanner.sharedInstance.setTitle("No internet connnection")
        }
        
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func drawRoute(route:Route) {
        let path = GMSMutablePath()
        
        let dropoffLocation = route.routePath?.first
        let myLocation = CLLocationCoordinate2D(latitude: Double((dropoffLocation?.lat!)!), longitude: Double((dropoffLocation?.lng!)!))
        
        var bounds: GMSCoordinateBounds = GMSCoordinateBounds(coordinate: myLocation, coordinate: myLocation)

        for dropoffLocation:DropoffLocation in route.routePath! {
            path.addLatitude(  Double(dropoffLocation.lat!), longitude:Double(dropoffLocation.lng!))
            
            bounds = bounds.includingCoordinate(CLLocationCoordinate2D(latitude: Double(dropoffLocation.lat!), longitude: Double(dropoffLocation.lng!))
            )
            self.mapView?.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 15.0))
        }
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 10.0
        polyline.geodesic = true
        polyline.map = mapView
        

        for stopPoint:StopPoint in route.stopPoints! {
            let position = CLLocationCoordinate2D(latitude: Double(stopPoint.lat!), longitude: Double(stopPoint.lng!))
            let marker = GMSMarker(position: position)
            marker.map = mapView
        }
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 30.00, longitude: 31.48, zoom: 16.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
    }
    
}
