//
//  ViewController.swift
//  FFWheelViewDemo
//
//  Created by JMF on 2017/11/1.
//  Copyright © 2017年 Zhe jiang Ye Mao Technology. All rights reserved.
//

import UIKit
import FFWheelView
class ViewController: UIViewController {

    var dataSources:[String] = ["0.jpg","1.jpg","2.jpg","3.jpg","4.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wheelView = FFWheelView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        wheelView.dataSources = self
        wheelView.delegate = self
        view.addSubview(wheelView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}
extension ViewController:FFWheelViewDataSources{
    
    func wheel(_ numberInWheelView: FFWheelView) -> Int {
        
        return dataSources.count
    }
    func wheel(_ itemInWheelView: FFWheelView, dataToItem item: FFWheelImageItemView, forIndex index: Int) {
        
        item.imageView.image = UIImage(named: dataSources[index])
        (item as?FFCustomItemView)?.title.text = "哈哈哈==\(index)"
    }
    
    func wheel(_ itemInWheelView: FFWheelView, forIndex index: Int) -> FFWheelImageItemView {
        
          let item = FFCustomItemView()
          item.imageView.image = UIImage(named: dataSources[index])
          item.title.text = "哈哈哈==\(index)"
          return item
        
//        let item = FFWheelImageItemView()
//        item.imageView.image = UIImage(named: dataSources[index])
//        return item
    }
}
extension ViewController:FFWheelViewDelegate{
    
    func wheel(_ wheelView: FFWheelView, selectItem item: FFWheelImageItemView, selectIndex index: Int) {
        
        print("点击了==\(index)")
    }
}
