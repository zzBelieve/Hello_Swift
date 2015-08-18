//
//  ViewController3.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/18.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ViewController3: UIViewController,UIScrollViewDelegate {

    var zzScrollView : UIScrollView!
    
    var zzImageView : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.zzScrollView = UIScrollView(frame: self.view.frame)
        self.zzScrollView?.delegate = self
        self.zzScrollView?.backgroundColor  = UIColor .cyanColor()
        
        //设置边距
        self.zzScrollView?.contentInset = UIEdgeInsetsMake(10, 20, 30, 40)
        
        //不显示水平滚动标示
        self.zzScrollView?.showsHorizontalScrollIndicator = false
        
        //不显示垂直滚动标示
        
        self.zzScrollView?.showsVerticalScrollIndicator = false;
        
        //设置偏移
        
        self.zzScrollView?.contentOffset = CGPointMake(0, -200)
        
        //取消弹簧效果
        
        self.zzScrollView?.bounces = true
        
        //设置放大/缩小最大比例
        
        self.zzScrollView?.minimumZoomScale = CGFloat(0.2)
        self.zzScrollView?.maximumZoomScale = CGFloat(2.0)
        
        self.view .addSubview(self.zzScrollView!)
        
        
        self.zzImageView = UIImageView()
        
        zzImageView?.image = UIImage(named: "小黄人PP.jpg")
        
        //根据图像自动大小调整
        zzImageView?.sizeToFit()
        
        zzScrollView?.contentSize = CGSizeMake(1500, 1000)
        
//        zzScrollView?.contentSize  = zzImageView?.image?.size
        
        zzScrollView! .addSubview(self.zzImageView!)
        
        
        
//        let button = UIButton()
        
//        var array = ["上","下","左","右"]
//        
//        let buttonW = 50
//        
//        let buttonH = 50
//        
//        for var index : Int = 0; index < array.count ; ++index {
//        
////            let x = (CGFloat)index * (50+10)
//            
//            var button = UIButton(frame: CGRect(x: index * (50+10), y: 500, width: buttonW, height: buttonH))
////            button.frame = CGRectMake(50, self.view.frame.size.height-100, 50, 50)index * (50+10)
////            button.backgroundColor = UIColor .blackColor()
//            
//            button.setTitle(array[index], forState: UIControlState.Normal)
//            button.setTitleColor(UIColor .redColor(), forState: UIControlState.Normal)
//            button.tag = 100 + index
//            button .addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
//            self.zzButton = button
//            self.view .addSubview(button)
//        }
//        
        
        let button1 = UIButton(frame: CGRectMake(10, 500, 50, 50))
        button1.setTitleColor(UIColor .redColor(), forState: UIControlState.Normal)
        button1.setTitle("上", forState: UIControlState.Normal)
        button1 .addTarget(self, action:"button1Click", forControlEvents: UIControlEvents.TouchUpInside)
        self.view .addSubview(button1)
        
    }

    func button1Click(){
    
        var offset : CGPoint = zzScrollView.contentOffset
    
        offset.y -= 10
        
        zzScrollView.contentOffset = offset
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.zzImageView
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
         println(__FUNCTION__)
        
//        println(NSStringFromCGAffineTransform(self.zzImageView?.transform!)
        
    }
    
//    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
//        println(__FUNCTION__)
//    }
    
    
    
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
