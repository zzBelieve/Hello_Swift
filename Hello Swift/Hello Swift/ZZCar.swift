//
//  ZZCar.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/24.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ZZCar: NSObject {
    
    var name: String  = ""
    
    var icon: String = ""
    
    
    
    init(dictionary: NSDictionary){
    
         super.init()
      
        
        self.setValuesForKeysWithDictionary(dictionary as [NSObject: AnyObject])
    
    }
    
    
    class func carWithDic(dictionary: NSDictionary)->ZZCar{
    
    
        return ZZCar(dictionary: dictionary)
    }
    
   
    
    class func carWithArray(array: NSArray)->NSMutableArray{
    
        var tempArray: NSMutableArray = NSMutableArray()
        
        
        for object in array{
        
             tempArray .addObject(ZZCar .carWithDic(object as! NSDictionary))
            
         }
    
        return tempArray
    }
}
