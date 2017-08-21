//
//  Utility.swift
//  DribbleInSwift
//
//  Created by Sumit Ghosh on 21/08/17.
//  Copyright © 2017 Sumit Ghosh. All rights reserved.
//

import UIKit

class Utility: NSObject {
    static let sharedInstance: Utility = {
        let instance = Utility()
        return instance
    }()
    
    func convertDictionaryToJSONString(dictionary:NSDictionary) -> String {
        
        let jsonData = try! JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
        
        return jsonString
        
        
    }
}
