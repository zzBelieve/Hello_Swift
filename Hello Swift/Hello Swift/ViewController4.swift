//
//  ViewController4.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/19.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ViewController4: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var texField: UITextField!
    
    var zzTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let zzTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        zzTableView.dataSource = self
        zzTableView.delegate = self
        zzTableView.rowHeight = 120
        self.zzTableView = zzTableView
        self.view .addSubview(zzTableView)
        
        
        
    }
    
    var heros : NSArray = HeroModel .heros()
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier: String = "Hero"
        
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell
        
        if (cell == nil){
        
           cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier)
        }
        
        //箭头
        
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        
        var row = indexPath.row
        
        let hero: HeroModel = HeroModel(zzDictionary: heros[row] as!NSDictionary)
        
        cell?.textLabel?.text = hero.name
        
        cell?.detailTextLabel?.text = hero.intro
        
        cell?.imageView?.image = UIImage (named: hero.icon)
        
        
        return cell!
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let hero: HeroModel = HeroModel(zzDictionary: heros[indexPath.row] as!NSDictionary)
        
        // UIAlertView 在 ios8已经废除
//        let al = UIAlertView (title: "数据展示", message: nil, delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
        
        let alController = UIAlertController (title: "数据展示", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
//        alController .addAction(UIAlertAction (title: "哈哈", style: UIAlertActionStyle.Destructive, handler: nil))
        
        alController.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            
            self.texField = textField
            
            textField.text = hero.name
        }
        
    
        
        
        var leftAlertAction = UIAlertAction (title: "确定", style: UIAlertActionStyle.Destructive) { (alertAction:UIAlertAction!) -> Void in
            
            println("\(self.texField.text)")
            
            hero.name = self.texField.text
            
            //刷新局部
            
            let zzIndexPath = NSIndexPath (forRow: indexPath.row, inSection: indexPath.section)
            
            
            // 为何没反应????????
            
            self.zzTableView .reloadRowsAtIndexPaths([zzIndexPath], withRowAnimation: UITableViewRowAnimation.Middle)
            
//            self.zzTableView .reloadData()
            
            
        }
          alController.addAction(leftAlertAction)
        
        var rightAlertAction = UIAlertAction (title: "取消", style: UIAlertActionStyle.Default, handler: nil)
        alController.addAction(rightAlertAction)
       
         self.presentViewController(alController, animated: true, completion: nil)
        
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
