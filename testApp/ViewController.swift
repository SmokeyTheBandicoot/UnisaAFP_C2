//
//  ViewController.swift
//  testApp
//
//  Created by Antonio Manzolillo on 25/06/2019.
//  Copyright © 2019 Antonio Manzolillo. All rights reserved.
// COPM

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let motionManager = CMMotionManager()
    var timer: Timer!
    
    @IBOutlet weak var txtz2: UITextField!
    @IBOutlet weak var txty2: UITextField!
    @IBOutlet weak var txtx2: UITextField!
    @IBOutlet weak var txtz: UITextField!
    @IBOutlet weak var txty: UITextField!
    @IBOutlet weak var txtx: UITextField!
    
    override func viewDidLoad()
    {super.viewDidLoad()
        // Do any additional setup after loading the view.
        motionManager.startAccelerometerUpdates()
        motionManager.startGyroUpdates()
        motionManager.startMagnetometerUpdates()
        motionManager.startDeviceMotionUpdates()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(ViewController.update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        if let accelerometerData = motionManager.accelerometerData {
            txtx.text=String(format: "%.3f",accelerometerData.acceleration.x)
            txty.text=String(format: "%.3f",accelerometerData.acceleration.y)
            txtz.text=String(format: "%.3f",accelerometerData.acceleration.z)
            
        }
        if let gyroData = motionManager.gyroData {
            txtx2.text=String(format: "%.3f",gyroData.rotationRate.x)
            txty2.text=String(format: "%.3f",gyroData.rotationRate.y)
            txtz2.text=String(format: "%.3f",gyroData.rotationRate.z)
        }
      }
}
