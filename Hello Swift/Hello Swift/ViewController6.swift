//
//  ViewController6.swift
//  Hello Swift
//
//  Created by ZZBelieve on 15/8/21.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class ViewController6: UIViewController,UIScrollViewDelegate {

    var ZZScrollView: UIScrollView!
    
    var ZZPageControll: UIPageControl!
    
    var ZZTimer: NSTimer!
    
    
    var imageArray: NSArray!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor .cyanColor()
        // Do any additional setup after loading the view.
        
        imageArray = ["小黄人1.jpeg","小黄人2.jpeg","小黄人3.jpeg"];
        
        let width = self.view.frame.size.width
        
        let sc: UIScrollView = UIScrollView(frame: CGRectMake(0, 100, width, 200))
        sc.delegate = self
        sc.contentSize = CGSizeMake(width * CGFloat(imageArray.count) , 200)
        //分页
        
        sc.pagingEnabled = true;
        
        //弹簧
        sc.bounces = false
        
        //水平滚动条
        sc.showsHorizontalScrollIndicator = false
        
        //垂直滚动条
        sc.showsVerticalScrollIndicator = false
        
        self.ZZScrollView = sc
        sc.backgroundColor = UIColor .cyanColor()
        
        self.view .addSubview(sc)
        
        
        let pageCon: UIPageControl = UIPageControl(frame: CGRectMake(0, 300, width, 40))
        
        pageCon.numberOfPages = imageArray.count
        
        pageCon.pageIndicatorTintColor = UIColor .whiteColor()
        
        pageCon.currentPageIndicatorTintColor = UIColor .redColor()
        
        pageCon .addTarget(self, action: "pageChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.ZZPageControll = pageCon
        
        self.view .addSubview(pageCon)
        
        
        for(var index: Int=0; index<3 ; index++){
        
            let imageView: UIImageView = UIImageView(frame: CGRectMake(CGFloat(index) * width, 0, width, 200))
            imageView.image = UIImage(named: "小黄人\(index+1).jpeg")
            imageView.backgroundColor = UIColor .redColor()
            self.ZZScrollView .addSubview(imageView)
        
        }
        
        //开始定时器
        
        startTimer()
        
    }

    func startTimer(){
    
        self.ZZTimer = NSTimer(timeInterval: 1.5, target: self, selector: "changePage", userInfo: "````", repeats: true)
        
    
        NSRunLoop.currentRunLoop().addTimer(self.ZZTimer, forMode: NSRunLoopCommonModes)
        
    }
    
    
    func changePage(){
    
        let page: Int = (self.ZZPageControll.currentPage+1) % (imageArray.count)
        
        self.ZZPageControll.currentPage = page
        
        
        pageChange(self.ZZPageControll)
    
    }
    func pageChange( PageControll:UIPageControl){
    
        
        
        println("\(PageControll.currentPage)")
        
        let x: CGFloat = CGFloat(PageControll.currentPage) * self.view.frame.size.width
        
        self.ZZScrollView .setContentOffset(CGPointMake(x, 0), animated: true)
        
        
    }
    
    
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let page:CGFloat = scrollView.contentOffset.x/scrollView.bounds.size.width;
        self.ZZPageControll.currentPage = Int(page)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.ZZTimer .invalidate()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        startTimer()
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
