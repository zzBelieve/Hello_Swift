//
//  ZZTgModel.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/20.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ZZTgModel: NSObject {
   
    var title: String = ""
    
    var icon: String = ""
    
    var price : String = ""
    
    var buyCount: String = ""
    
    
    init(dictionary: NSDictionary) {
        
         super.init()
        
        self.setValuesForKeysWithDictionary(dictionary as [NSObject : AnyObject])
    }
    
    
    class func tgWithDictionary(dictionary: NSDictionary) -> ZZTgModel{
    
    
       return ZZTgModel(dictionary: dictionary)
    }
    
    
    
    class func tgs() -> NSMutableArray{
    
    
        let path : String = NSBundle.mainBundle().pathForResource("tgs.plist", ofType: nil)!
        
        let zzArray : NSArray = NSArray(contentsOfFile: path)!
        
        
        var tempArray: NSMutableArray = NSMutableArray()
        
        for dic in zzArray{
        
            let model = ZZTgModel.tgWithDictionary(dic as! NSDictionary)
            
            tempArray .addObject(model)
        }
        
        return tempArray
        
        
    }
    
    
}