//
//  PopularData.swift
//  DribbleInSwift
//
//  Created by Sumit Ghosh on 09/08/17.
//  Copyright © 2017 Sumit Ghosh. All rights reserved.
//

import UIKit
import ObjectMapper

class PopularData: NSObject {
    
    func getDataForPopularTable(callback: @escaping (NSArray) -> Void) -> Void {
        Apihelper.init().dataForPopularTable { (dataPopular) in
            let finalPopularArray:NSArray = self .finalPopularDataArray(dataArray: dataPopular)
            callback(finalPopularArray)
        }
    }
    
    func finalPopularDataArray(dataArray:NSArray) -> NSArray {
        let finalArray:NSMutableArray = NSMutableArray.init()
        for dataDict in dataArray{
            let  jsonString = Utility.sharedInstance.convertDictionaryToJSONString(dictionary: dataDict as! NSDictionary)
            let  popularModel = Mapper<MainArrayModel>().map(JSONString: jsonString)
            finalArray .add(popularModel)
        }
        return finalArray
        
    }
}
