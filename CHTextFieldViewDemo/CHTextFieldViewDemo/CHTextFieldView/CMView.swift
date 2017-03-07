//
//  CMView.swift
//  CHTextFieldView
//
//  Created by CM on 2017/3/6.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMView: UIView {

    typealias DoWhat = () -> Void
    var doWhat: DoWhat?
    
    typealias DoWhatForBeginEditing = () -> Void
    var doWhatForBeginEditing: DoWhatForBeginEditing?
    
    typealias DoWhatForShouldReturn = () -> Void
    var doWhatForShouldReturn: DoWhatForShouldReturn?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
    }
    

    convenience init(frame: CGRect, labelTitle: String, labelColor: UIColor, labelSize: CGFloat) {
        self.init(frame: frame)
        
        let label = CMLabel(frame: CGRect(x: 12, y: 8, width: 200, height: 20), title: labelTitle, color: labelColor, sizeTitle: labelSize)
        self.addSubview(label)
        
        let tf = CMTextField(frame: CGRect(x: 12, y: 8+8+label.frame.height, width: self.frame.size.width, height: 20), title: "520.1314", color: UIColor.red, sizeTitle: 16)
        self.addSubview(tf)
        
        tf.doWhatForBeginEditing = {
            self.doWhatForBeginEditing?()
        }
        
        tf.doWhatForShouldReturn = {
            self.doWhatForShouldReturn?()
        }
        
        let frame = CGRect(x: 12, y: 8+8+8+label.frame.height+tf.frame.height, width: self.frame.size.width - 24, height: 1)
        let viewLine = CMLineView(frame: frame, backgroundColor: UIColor.blue)
        self.addSubview(viewLine)
        
        
        
        let button = CMButton(image: #imageLiteral(resourceName: "logo_black_sm")) {
            self.doWhat?()
        }
        
        button.frame = CGRect(x: self.frame.width - 13 - 22, y: self.frame.height/2-13, width: 26, height: 26)
        self.addSubview(button)

        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
