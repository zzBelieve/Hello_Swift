//
//  ViewController1.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/17.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ViewController1: UIViewController,UITableViewDataSource,UITableViewDelegate {

    lazy var dataList : NSArray = {
    
        var model1 : Model = Model()
        model1.name = "第一筐鸡蛋"
        model1.desc = "天下第一"
        
        var list : NSMutableArray = NSMutableArray()
        
        for var index: Int = 0; index < 10 ; ++index{
            list .addObject("\(model1.name) - " + "\(index)")
        }
        model1.Fruit = list
        
        
        var model2 : Model = Model()
        model2.name = "第er筐鸡蛋"
        model2.desc = "天下第er"
        
        
        var list2 : NSMutableArray = NSMutableArray()
        
        for var index: Int = 0; index < 10 ; ++index{
            list2 .addObject("\(model2.name) - " + "\(index)")
        }
        model2.Fruit = list2
        
        var tempList: NSArray = [model1, model2]
        
        
        return tempList;
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let zzTableView = UITableView (frame: self.view.bounds, style: UITableViewStyle.Plain)
        zzTableView.dataSource = self
        zzTableView.delegate = self
        self.view .addSubview(zzTableView)
        
        
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList[section].Fruit.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let indetifier : String = "ID"
        
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(indetifier) as? UITableViewCell
        
        if (cell == nil){
        
            cell = UITableViewCell (style: UITableViewCellStyle.Default, reuseIdentifier: indetifier)
        }
        
        var model : Model = dataList[indexPath.section] as! Model
        
        cell?.textLabel?.text = model.Fruit[indexPath.row] as? String
        
        return cell!
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.dataList[section].name
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        return self.dataList[section].desc
        
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
