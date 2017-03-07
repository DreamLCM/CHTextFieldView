//
//  CMButton.swift
//  CHTextFieldView
//
//  Created by CM on 2017/3/7.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMButton: UIButton {
    
    typealias DoWhat = () -> Void
    var doWhat: DoWhat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String, block: @escaping DoWhat) {
        let size = title.textSizeWithFont(UIFont.boldSystemFont(ofSize: 17), constrainedToSize: CGSize(width: 2000,height: 2000))
        self.init(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.setTitle(title, for: UIControlState())
        self.titleLabel!.font = UIFont.boldSystemFont(ofSize: 17)
        self.titleLabel!.minimumScaleFactor = 0.5
        self.titleLabel!.adjustsFontSizeToFitWidth = true
        self.titleLabel!.textColor = UIColor.white
        self.setTitleColor(UIColor.white, for: UIControlState())
        self.setTitleColor(UIColor.darkText, for: UIControlState.highlighted)
        self.setTitleColor(UIColor.darkText, for: UIControlState.selected)
        self.addTarget(self, action: #selector(CMButton.buttonPress), for: UIControlEvents.touchUpInside)
        
        doWhat = block
        
    }
    
    
    convenience init(image: UIImage, size: CGSize? = nil, block: @escaping DoWhat) {
        var mSize = size
        if mSize == nil {
            mSize = CGSize(width: image.size.width, height: image.size.height)
        }
        self.init(frame: CGRect(x: 0, y: 0, width: mSize!.width, height: mSize!.height))
        self.setImage(image, for: UIControlState())
        self.setImage(image, for: UIControlState.highlighted)
        self.addTarget(self, action: #selector(CMButton.buttonPress), for: UIControlEvents.touchUpInside)
        
        doWhat = block
    }
    
    convenience init(image: UIImage, imageSelect: UIImage, size: CGSize? = nil, block: @escaping DoWhat) {
        var mSize = size
        if mSize == nil {
            mSize = CGSize(width: image.size.width, height: image.size.height)
        }
        self.init(frame: CGRect(x: 0, y: 0, width: mSize!.width, height: mSize!.height))
        self.setImage(image, for: UIControlState())
        self.setImage(image, for: UIControlState.highlighted)
        self.setImage(imageSelect, for: .selected)
        self.addTarget(self, action: #selector(CMButton.buttonPress), for: UIControlEvents.touchUpInside)
        
        doWhat = block
    }
    
    
    
    convenience init(title: String, image: UIImage, block: @escaping DoWhat) {
        
        let size = title.textSizeWithFont(UIFont.systemFont(ofSize: 17), constrainedToSize: CGSize(width: 2000,height: 2000))
        let height: CGFloat = image.size.height > size.height ? image.size.height:size.height;
        
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: size.width + image.size.width + 10, height: height))
        self.setTitle(title, for: UIControlState())
        self.titleLabel!.font = UIFont.boldSystemFont(ofSize: 17)
        self.titleLabel!.minimumScaleFactor = 0.5
        self.titleLabel!.adjustsFontSizeToFitWidth = true
        self.titleLabel!.textColor = UIColor.white
        self.setTitleColor(UIColor.white, for: UIControlState())
        self.setTitleColor(UIColor.white, for: UIControlState.highlighted)
        self.setTitleColor(UIColor.white, for: UIControlState.selected)
        self.setImage(image, for: UIControlState())
        self.setImage(image, for: UIControlState.highlighted)
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10)
        self.addTarget(self, action: #selector(CMButton.buttonPress), for: UIControlEvents.touchUpInside)
        
        doWhat = block
    }

    
    //点击按钮事件
    func buttonPress() {
        self.doWhat?()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
}
