//
//  ViewController7.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/24.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ViewController7: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var carsGroup: NSMutableArray = ZZCargruop.carsGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let zzTableView: UITableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        zzTableView.dataSource = self
        zzTableView.delegate = self
        self.view .addSubview(zzTableView)
        
        
        
        // Do any additional setup after loading the view.
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return carsGroup.count
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let cars: ZZCargruop = carsGroup[section] as! ZZCargruop
        return cars.cars.count
        
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier: NSString  = "car"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier as String) as? UITableViewCell
        
        if( cell==nil){
        
          
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier as String)
        
        }
        
        let group: ZZCargruop = carsGroup[indexPath.section] as!ZZCargruop
        let car: ZZCar = group.cars[indexPath.row] as! ZZCar
        
        cell?.imageView?.image = UIImage(named: car.icon)
        cell?.textLabel?.text = car.name
        
        return cell!
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group: ZZCargruop = carsGroup[section] as! ZZCargruop
        
        return group.title
        
        
    }
    
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        
        let array: NSArray = carsGroup.valueForKeyPath("cars.name") as! NSArray
        
        return carsGroup.valueForKeyPath("title") as! [AnyObject]
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
