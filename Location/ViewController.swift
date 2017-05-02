//
//  ViewController.swift
//  Location
//
//  Created by Shilp_m on 1/30/17.
//  Copyright © 2017 Shilp_mphoton pho. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,locationDelegate {

    private var scarySingleton = SingletonClass.SharedInstance
    private var observerContext = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.scarySingleton.startUpdatingLocation()
        self.scarySingleton.locationdelegate = self
        self.scarySingleton.addObserver(self, forKeyPath: "name", options: [.new, .old], context: &observerContext)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let k = kvc()
        let string = k.value(forKey: "name") as! String
        print(string)
        
    }
    override func viewWillAppear(_ animated: Bool) {
      print("jjjj")
    }
    
    func locationData(locationdata: CLLocation) {
        print(locationdata)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

