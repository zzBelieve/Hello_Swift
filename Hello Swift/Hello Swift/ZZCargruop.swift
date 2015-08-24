//
//  ZZCargruop.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/24.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ZZCargruop: NSObject {
    
    
    var title: String = ""
    var cars: NSArray = NSArray()
    
    
    
    init(dictionary: NSDictionary){
    
    
       super.init()
        
        self .setValue(dictionary["title"], forKey: "title")
        self.cars = ZZCar.carWithArray(dictionary["cars"] as! NSArray)
    
    }
    
    class func groupWithDic(dictionary: NSDictionary)->ZZCargruop{
    
    
       return ZZCargruop(dictionary: dictionary)
    }
    
    
    class func carsGroup()->NSMutableArray{
        
        
        let path: NSString = NSBundle.mainBundle().pathForResource("cars_total.plist", ofType: nil)!
        let array: NSArray = NSArray (contentsOfFile: path as String)!
        
        var tempArray: NSMutableArray = NSMutableArray()
        
        
        for object in array{
        
           tempArray.addObject(ZZCargruop.groupWithDic(object as!NSDictionary))
        
        }
        
        return tempArray
    }
   
}
