//
//  ReboundData.swift
//  DribbleInSwift
//
//  Created by Sumit Ghosh on 09/08/17.
//  Copyright © 2017 Sumit Ghosh. All rights reserved.
//

import UIKit
import ObjectMapper

class ReboundData: NSObject {
    func getDataForReboundTable(callback: @escaping (NSArray) -> Void) -> Void {
        Apihelper.init() .getDataForRebound { (data) in
            let reboundFinalArray:NSArray=self .finalData(dataArray: data)
            callback(reboundFinalArray)
        }
        
    }
    
func finalData(dataArray:NSArray) -> NSArray {
    let finalArray:NSMutableArray = NSMutableArray.init()
    
    for dataDict in dataArray{
        let  jsonString = Utility.sharedInstance.convertDictionaryToJSONString(dictionary: dataDict as! NSDictionary)
        let reboundModel = Mapper<MainArrayModel>().map(JSONString: jsonString)
        finalArray .add(reboundModel)
    }
    return finalArray
}


}
