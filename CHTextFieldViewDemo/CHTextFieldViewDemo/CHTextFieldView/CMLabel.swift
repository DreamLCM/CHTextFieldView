//
//  CMLabel.swift
//  CHTextFieldView
//
//  Created by CM on 2017/3/7.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect, title: String, color: UIColor, sizeTitle: CGFloat) {
        self.init(frame: frame)
        self.text = title
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: sizeTitle)
    }
    
    
    
}
