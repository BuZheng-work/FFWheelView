//
//  FFCustomItemView.swift
//  FFWheelViewDemo
//
//  Created by JMF on 2017/11/1.
//  Copyright © 2017年 Zhe jiang Ye Mao Technology. All rights reserved.
//

import UIKit
import FFWheelView
class FFCustomItemView: FFWheelImageItemView {

    let title:UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 18)
        lable.textColor = UIColor.white
        return lable
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        title.frame = CGRect(x: 0, y: frame.height-20, width: frame.width, height: 20)
        
    }
}
