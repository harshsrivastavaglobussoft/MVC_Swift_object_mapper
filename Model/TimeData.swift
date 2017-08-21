//
//  TimeData.swift
//  DribbleInSwift
//
//  Created by Sumit Ghosh on 09/08/17.
//  Copyright © 2017 Sumit Ghosh. All rights reserved.
//

import UIKit
import ObjectMapper

class TimeData: NSObject {
    func getDataForTimeTable(callback: @escaping (NSArray) -> Void) -> Void {
        Apihelper.init().dataForTimeTable { (dataTime) in
            let timeFinalArray:NSArray = self .finalTimeTableArray(dataArray: dataTime)
            callback(timeFinalArray)
        }
    }
    
    func finalTimeTableArray(dataArray:NSArray) -> NSArray {
        let finalArray:NSMutableArray = NSMutableArray.init()
        for dataDict in dataArray{
            let  jsonString = Utility.sharedInstance.convertDictionaryToJSONString(dictionary: dataDict as! NSDictionary)
            let  timeModel = Mapper<MainArrayModel>().map(JSONString: jsonString)
            finalArray .add(timeModel)
        }
        return finalArray
        
    }
}
