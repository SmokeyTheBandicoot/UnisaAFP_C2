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

    // Record Manager Variables
    var dataRecorder: DataRecorder = DataRecorder()
    
    // Sensor variables
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
        
        var acc: [Coord: Double] = [Coord.x: 0.0, Coord.y: 0.0, Coord.z: 0.0]
        var gyr: [Coord: Double] = [Coord.x: 0.0, Coord.y: 0.0, Coord.z: 0.0]
        var face: [FaceIDAngle: Double] = [FaceIDAngle.roll: 0.0, FaceIDAngle.yaw: 0.0]
        var app: String = "No App"
        
        if let accelerometerData = motionManager.accelerometerData {
            txtx.text=String(format: "%.3f",accelerometerData.acceleration.x)
            acc[Coord.x] = accelerometerData.acceleration.x
            txty.text=String(format: "%.3f",accelerometerData.acceleration.y)
            acc[Coord.y] = accelerometerData.acceleration.y
            txtz.text=String(format: "%.3f",accelerometerData.acceleration.z)
            acc[Coord.z] = accelerometerData.acceleration.z
            
        }
        
        if let gyroData = motionManager.gyroData {
            txtx2.text=String(format: "%.3f",gyroData.rotationRate.x)
            gyr[Coord.x] = gyroData.rotationRate.x
            txty2.text=String(format: "%.3f",gyroData.rotationRate.y)
            gyr[Coord.y] = gyroData.rotationRate.y
            txtz2.text=String(format: "%.3f",gyroData.rotationRate.z)
            gyr[Coord.z] = gyroData.rotationRate.z
        }
        
        dataRecorder.appendRecord(record:
            DataRecord(
            // Record Accel Data
            AccelData: [Coord.x: acc[Coord.x]!, Coord.y: acc[Coord.y]!, Coord.z: acc[Coord.z]!],
                // Record Gyroscope Data
            GyrData: [Coord.x: gyr[Coord.x]!, Coord.y: gyr[Coord.y]!, Coord.z: gyr[Coord.z]!],
            // Record Face ID Data
            FaceIDData: [FaceIDAngle.roll: face[FaceIDAngle.roll]!, FaceIDAngle.yaw: face[FaceIDAngle.yaw]!],
            // Record App Data
            curApp: app))
        
      }
}
