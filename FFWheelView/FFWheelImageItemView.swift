//
//  FFWheelImageItemView.swift
//  FFWheelView
//
//  Created by JMF on 2017/11/1.
//  Copyright © 2017年 Zhe jiang Ye Mao Technology. All rights reserved.
//

import UIKit

open class FFWheelImageItemView: UIView {
   
    public let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    open override  func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
}
