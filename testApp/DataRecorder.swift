//
//  DataRecorder.swift
//  testApp
//
//  Created by Michele Gargiulo on 04/07/2019.
//  Copyright © 2019 Antonio Manzolillo. All rights reserved.
//

import Foundation

class DataRecorder {
    
    private var Records: [[Date: DataRecord]] = [[:]]
    
    
    // Add a simple Record (Data is automatically captured)
    public func appendRecord(record: DataRecord) {
        Records.append([Date(): record])
    }
    
    
    // Remember that Recording data is protected, never return a reference to the Records
    public func getAllRecords() -> [[Date: DataRecord]]{
        
        if Records.count > 0 {
            var temp: [[Date: DataRecord]] = [[:]]
            var i = 0
            
            // Copy the values, DO NOT PASS THE REFERENCE!
            while i < Records.count {
                temp.append(Records[i])
                i += 1
            }
            return temp
        } else { return [[:]] }
        
    }
    
    
    public func getLastRecord() -> [Date: DataRecord]? {
        return Records.count > 0 ? Records[Records.count - 1] : nil
    }
    
    public func getFirstRecord() -> [Date: DataRecord]? {
        return Records.count > 0 ? Records[0] : nil
    }
    
    
}
