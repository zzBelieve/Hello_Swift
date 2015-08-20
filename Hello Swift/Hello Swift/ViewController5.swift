//
//  ViewController5.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/20.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ViewController5: UIViewController,UITableViewDataSource,UITableViewDelegate {

    lazy var tgArray: NSMutableArray = ZZTgModel.tgs()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let zzTableView : UITableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        zzTableView.dataSource = self
        zzTableView.delegate = self
        zzTableView.rowHeight = 120
        self.view.addSubview(zzTableView)
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
