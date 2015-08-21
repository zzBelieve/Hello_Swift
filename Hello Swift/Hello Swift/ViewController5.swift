//
//  ViewController5.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/20.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ViewController5: UIViewController,UITableViewDataSource,UITableViewDelegate,ZZTgFootViewDelegate{

    lazy var tgArray: NSMutableArray = ZZTgModel.tgs()
    
    var zzTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let zzTableView : UITableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        zzTableView.dataSource = self
        zzTableView.delegate = self
        zzTableView.rowHeight = 120
        self.zzTableView = zzTableView
        self.view.addSubview(zzTableView)
        
        
        
        
        /*footerView*/
        
        
        let footView = ZZTgFooterView .footView()
        footView.delagate = self
        zzTableView.tableFooterView = footView
    }

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tgArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: ZZTgCell = ZZTgCell.cellWithTableView(tableView)
        
        
        cell.tg = self.tgArray[indexPath.row] as!ZZTgModel
        
        return cell
    }
    
    
    /***ZZTgFooterViewDelegate*****/
    
    
    func tgFooterViewDidDownloadButtonClick(footview : ZZTgFooterView) -> (){
//
                  println("加载中~~")
//
//        
                /*模拟延迟*/
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC)), dispatch_get_main_queue()){
        
        
                    let dic : [String : String] = ["title":"军哥海天浴场","icon": "小黄人Love.jpg", "price": "88888", "buyCount": "250"]
        
                    let tg: ZZTgModel = ZZTgModel.tgWithDictionary(dic)
        
                    self.tgArray .addObject(tg)
        
        
                    let zzPath: NSIndexPath = NSIndexPath(forRow: self.tgArray.count-1, inSection: 0)
        
        
                    self.zzTableView .insertRowsAtIndexPaths([zzPath], withRowAnimation: UITableViewRowAnimation.Bottom)
                   
                    footview .endReFresh()
                
                }
//
//        
//        
//    
//    
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
