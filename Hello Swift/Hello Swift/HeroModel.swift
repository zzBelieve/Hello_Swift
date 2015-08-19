//
//  HeroModel.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/19.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class HeroModel: NSObject {
   
    //名字
    var name: String = ""
    

    //头像
    
    var icon: String = ""
    
    //描述
    
    var intro: String = ""
    
    
    
    init(zzDictionary: NSDictionary) {
        
        super.init()
        
        self.setValuesForKeysWithDictionary(zzDictionary as [NSObject : AnyObject])
        
    }
    
    
    class func heroWithDict(zzdictionary: NSDictionary)->HeroModel{
    
       
       return HeroModel(zzDictionary: zzdictionary)
    }
    
    
    class func heros() ->NSArray{
    
         let Bundel = NSBundle.mainBundle()
        
        let array: NSArray = NSArray (contentsOfFile: Bundel.pathForResource("heros.plist", ofType: nil)!)!
        
        var tempArray : NSMutableArray = NSMutableArray()
    
        for object in array{
         
            tempArray .addObject(HeroModel.heroWithDict(object as! NSDictionary))
        
        }
        
        return array
    }
    
}
