//
//  ViewController2.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/17.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    var dataList : NSMutableArray = ["苍老师","小泽玛利亚","麻生希","樱井莉亚"]
    
    lazy var zztabView: UITableView = {
    
        var tempTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        return tempTableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.orangeColor()
        // Do any additional setup after loading the view.
        
        self.makeNav()
        
        
//        let zzTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
//        zzTableView.dataSource = self
//        zzTableView.delegate = self
        
        self.view .addSubview(zztabView)
        
        
    }
    
    
    func makeNav(){
    
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "LeftBarClick")
       
        let button1 = UIButton(frame: CGRectMake(0, 0, 45, 45))
        button1.setTitle("编辑", forState: UIControlState.Normal)
        button1.setTitleColor(UIColor .blackColor(), forState: UIControlState.Normal)
        button1 .addTarget(self, action: "rightClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        let rightButton = UIBarButtonItem(customView: button1)
        
        self.navigationItem.rightBarButtonItem = rightButton
    
    }
    func rightClick(){
    
      
        println("right")
        zztabView.editing = true
    }
    
    func LeftBarClick(){
        
        println("Left")
        
        zztabView.editing = false
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    
    /**TableView DataSource**/
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "ID"
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell
        
        if( cell == nil){
        
           cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        
        }
        
        cell?.textLabel?.text = dataList[indexPath.row] as? String
        
        return cell!
    }
    
    
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete){
        
              dataList.removeObjectAtIndex(indexPath.row)
            
              tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }else if (editingStyle == UITableViewCellEditingStyle.Insert){
        
             dataList .insertObject("春鹏", atIndex: indexPath.row+1)
            
            let zzIndexPath = NSIndexPath(forRow: indexPath.row+1, inSection: indexPath.section)
        
            zztabView.insertRowsAtIndexPaths([zzIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        if(indexPath.row % 2 == 1){
            
            return UITableViewCellEditingStyle.Insert
        }else{
        
            return UITableViewCellEditingStyle.Delete
        }
        
        
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        zztabView.moveRowAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)
        dataList.exchangeObjectAtIndex(sourceIndexPath.row, withObjectAtIndex: destinationIndexPath.row)
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        println("点击了\(indexPath.row)行")
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
