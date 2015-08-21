//
//  ZZTgFooterView.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/21.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit



/***Delegate*****/


protocol ZZTgFootViewDelegate : NSObjectProtocol{
    // protocoldefinition goes here
    
    
    func tgFooterViewDidDownloadButtonClick(footview : ZZTgFooterView) -> ()
    
}

class ZZTgFooterView: UIView {

    /****定义代理****/
    
    weak var delagate: ZZTgFootViewDelegate?
    
    
    
    @IBOutlet weak var LoadMoreButton: UIButton!
   
   
    @IBAction func MoreButtonClick(sender: AnyObject) {
        
        LoadMoreButton.hidden = true
        
        TipView.hidden = false
        
        /********/
        
        delagate?.tgFooterViewDidDownloadButtonClick(self)
    }
    
    @IBOutlet weak var TipView: UIView!
    
    
    
    class func footView() -> ZZTgFooterView{
    
    
        let array : NSArray = NSBundle.mainBundle().loadNibNamed("ZZTgFooterView", owner: nil, options: nil)
     
        return array.lastObject as! ZZTgFooterView!
    }
    
    
   func endReFresh() ->(){
        
        LoadMoreButton.hidden = false
        TipView.hidden = true
    }

}
