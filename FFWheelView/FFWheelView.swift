//
//  FFWheelView.swift
//  FFWheelView
//
//  Created by JMF on 2017/11/1.
//  Copyright © 2017年 Zhe jiang Ye Mao Technology. All rights reserved.
//

import UIKit

public protocol FFWheelViewDataSources {
    
    func wheel(_ numberInWheelView:FFWheelView) -> Int
    func wheel(_ itemInWheelView:FFWheelView,forIndex index:Int) -> FFWheelImageItemView
    func wheel(_ itemInWheelView:FFWheelView,dataToItem item:FFWheelImageItemView,forIndex index:Int)

}
@objc public protocol FFWheelViewDelegate {
    
     @objc optional func wheel(_ wheelView:FFWheelView, selectItem item :FFWheelImageItemView, selectIndex index:Int)
}

open class FFWheelView: UIView {

    private var totle:Int = 0
    private var curtIndex:Int = 0
    private var currentView:FFWheelImageItemView?
    private var leftView:FFWheelImageItemView?
    private var rightView:FFWheelImageItemView?
    private var timer:Timer?
    
    public var timeInterval:Double = 3
    public weak var delegate:FFWheelViewDelegate?
    public var dataSources:FFWheelViewDataSources?{
        
        willSet{
            
            guard newValue != nil else {return}
            totle = newValue!.wheel(self)
            leftView = newValue!.wheel(self, forIndex: (curtIndex + totle - 1)%totle)
            currentView = newValue!.wheel(self, forIndex: curtIndex)
            rightView = newValue!.wheel(self, forIndex: (curtIndex + 1)%totle)
            layoutWheelItem()
            startTime()
        }
    }
    
   
    
    
    private let wheelScroller:UIScrollView = {
           let scoller = UIScrollView()
           scoller.showsVerticalScrollIndicator = false
           scoller.showsHorizontalScrollIndicator = false
           scoller.isPagingEnabled = true
          return scoller
        
    }()
    
   private func startTime() {
        
       timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(self.changePage), userInfo:nil, repeats: true)
    }
    
    @objc private func changePage() {
        
        wheelScroller.setContentOffset(CGPoint(x: CGFloat(2) * wheelScroller.bounds.width, y:0), animated: true)
    }
    
    
   private func reloadWheelItem() {
        
        var leftIndex:Int!
        var rightIndex:Int!
        let offset = wheelScroller.contentOffset
        
        if offset.x == 2*wheelScroller.bounds.width {
            
            curtIndex = (curtIndex + 1)%totle
            
        }else if offset.x == 0{
            
            curtIndex = (curtIndex + totle - 1)%totle
        }
        
        
        leftIndex = (curtIndex + totle - 1)%totle
        rightIndex = (curtIndex + 1)%totle
        dataSources?.wheel(self, dataToItem: currentView!, forIndex: curtIndex)
        dataSources?.wheel(self, dataToItem: leftView!, forIndex: leftIndex)
        dataSources?.wheel(self, dataToItem: rightView!, forIndex: rightIndex)

        
    }
    
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        wheelScroller.delegate = self
        wheelScroller.frame = bounds
        addSubview(wheelScroller)
    }
    
    
    private  func creatTapRecognizer()->UITapGestureRecognizer{
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.selectItem))
        return tap
    }
    
    @objc private func selectItem()  {
    
       delegate?.wheel?(self, selectItem: currentView!, selectIndex: curtIndex)
   }
    
    
    private func layoutWheelItem() {
        
        leftView?.addGestureRecognizer(creatTapRecognizer())
        rightView?.addGestureRecognizer(creatTapRecognizer())
        currentView?.addGestureRecognizer(creatTapRecognizer())
        
        wheelScroller.addSubview(leftView!)
        wheelScroller.addSubview(currentView!)
        wheelScroller.addSubview(rightView!)
        
        wheelScroller.contentSize = CGSize(width:CGFloat(3) *
            wheelScroller.frame.width, height: wheelScroller.frame.height)
        wheelScroller.setContentOffset(CGPoint(x: wheelScroller.bounds.width, y: 0), animated: false)
    
        leftView!.frame = CGRect(x: 0, y: 0, width: wheelScroller.bounds.size.width, height: wheelScroller.bounds.size.height)
        currentView!.frame = CGRect(x: wheelScroller.bounds.size.width, y: 0, width: wheelScroller.bounds.size.width, height: wheelScroller.bounds.size.height)
        rightView!.frame = CGRect(x: CGFloat(2) * wheelScroller.bounds.size.width, y: 0, width: wheelScroller.bounds.size.width, height: wheelScroller.bounds.size.height)
   
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
}
extension FFWheelView : UIScrollViewDelegate{
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        reloadWheelItem()
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.width, y:0), animated: false)
    }
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        timer?.fireDate = Date.distantFuture
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        reloadWheelItem()
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.width, y:0), animated: false)
        timer?.fireDate = Date(timeInterval: timeInterval, since: Date())
        
    }
    
}

