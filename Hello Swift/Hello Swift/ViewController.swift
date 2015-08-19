//
//  ViewController.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/17.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var dataList = ["列表展示(Header Footer)","tableView操作(插入,增加)","ScrollView","LOL _ Heros ","列表展示","列表展示"]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ZZTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        ZZTableView.dataSource = self
        ZZTableView.delegate = self
        self.view .addSubview(ZZTableView)
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier : String = "cell"
        
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell
        
        if (cell == nil){
        
           cell = UITableViewCell (style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        
        }
        
        cell?.textLabel?.text = self.dataList[indexPath.row] as? String
        
        return cell!
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
        
            
        case 0 :
            
            let vc1 = ViewController1();
            vc1.title = "Header Footer"
            self.navigationController?.pushViewController(vc1, animated: true)
            
            
            
            case 1 :
            
            
                let vc2 = ViewController2();
            self.navigationController?.pushViewController(vc2, animated: true)
            
            case 2 :
            
                let vc3 = ViewController3();
            
            self.navigationController?.pushViewController(vc3, animated: true)
            
            case 3 :
            
                println("...")
            
                let vc4 = ViewController4();
                
                self.navigationController?.pushViewController(vc4, animated: true)
            
        default: println("11")
        
        }
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

