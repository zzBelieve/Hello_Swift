//
//  ZZTgCell.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/20.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ZZTgCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var BuyCountLabel: UILabel!
    
  
    
    var tg:  ZZTgModel{
    
        get{
        
            return tg;
        }
    
        set{
        
           iconView.image = UIImage(named: newValue.icon)
        
           nameLabel.text = newValue.title
            
            PriceLabel.text = "价格: \(newValue.price)元"
        
            BuyCountLabel.text = "已有\(newValue.buyCount)人购买"
        }
    
    }
    
    
    /**便利方法**/
    
    class func cellWithTableView(tablevView:UITableView) -> ZZTgCell{
    
        let identifier: String = "tg"
        
        var cell: ZZTgCell? = tablevView.dequeueReusableCellWithIdentifier(identifier) as? ZZTgCell
        
        if(cell == nil){
           
            let array: NSArray = NSBundle.mainBundle().loadNibNamed("ZZTgCell", owner: nil, options: nil)
            
            cell = array.lastObject as? ZZTgCell
        
        }
        
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
