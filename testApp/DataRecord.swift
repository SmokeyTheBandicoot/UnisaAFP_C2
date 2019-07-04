//
//  DataRecord.swift
//  testApp
//
//  Created by Michele Gargiulo on 04/07/2019.
//  Copyright © 2019 Antonio Manzolillo. All rights reserved.
//

import Foundation

struct DataRecord {
    
    // Accelerometer data
    var AccelData: [Coord: Double]
    
    // Gyroscope data
    var GyrData: [Coord: Double]
    
    // Face ID Data
    var FaceIDData: [FaceIDAngle: Double]
    
    // App data
    var curApp: String
    
    
}
