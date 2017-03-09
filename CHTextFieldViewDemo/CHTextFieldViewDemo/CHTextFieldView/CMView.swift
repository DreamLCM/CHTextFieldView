//
//  CMView.swift
//  CHTextFieldView
//
//  Created by CM on 2017/3/6.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMView: UIView {

    typealias ButtonDoWhat = () -> Void
    var buttonDoWhat: ButtonDoWhat? {
        didSet {
            self.button?.doWhat  = buttonDoWhat
        }
    }
    
    typealias DoWhatForBeginEditing = () -> Void
    var doWhatForBeginEditing: DoWhatForBeginEditing? {
        didSet {
            self.tf?.doWhatForBeginEditing  = doWhatForBeginEditing
        }
    }
    
    typealias DoWhatForShouldReturn = () -> Void
    var doWhatForShouldReturn: DoWhatForShouldReturn? {
        didSet {
            self.tf?.doWhatForShouldReturn = doWhatForShouldReturn
        }
    }
    
    typealias TapDoWhat = () -> Void
    var tapDoWhat: TapDoWhat? {
        didSet {
            
        }
    }

    
    
    // label的属性
    var labelColor = UIColor.blue {
        didSet {
            self.label?.textColor = self.labelColor
        }
    }
    
    var labelText = "Available" {
        didSet {
            self.label?.text = self.labelText
        }
    }
    
    var labelSize:CGFloat = 14 {
        didSet {
            self.label?.font = UIFont.systemFont(ofSize: labelSize)
        }
    }
    
    // textField 的属性
    var textFieldTitle = "520.1414" {
        didSet {
            self.tf?.text = textFieldTitle
        }
    }

    var textFieldSize: CGFloat = 16 {
        didSet {
            self.tf?.font = UIFont.systemFont(ofSize: textFieldSize)
        }
    }
    
    var textFieldColor = UIColor.red {
        didSet {
            self.tf?.textColor = textFieldColor
        }
    }
    
    
    // 等于 false时键盘点击无效
    var textFieldIsEnable = true {
        didSet {
            self.tf?.isEnabled = textFieldIsEnable
        }
    }
    
    //viewLine 的属性
    var lineColor = UIColor.gray {
        didSet {
            self.viewLine?.backgroundColor = lineColor
        }
    }
    
    //button 的属性
    var backgroundImage = UIImage() {
        didSet {
            self.button?.setImage(backgroundImage, for: .normal)
        }
    }
    
    var buttonTitle = "button" {
        didSet {
            self.button?.setTitle(buttonTitle, for: .normal)
        }
    }
    
    var buttonSize = CGSize(width: 26, height: 26) {
        didSet {
            self.button?.frame.size = buttonSize
        }
    }
    
    
    
    var label: CMLabel?
    var tf: CMTextField?
    var viewLine: CMLineView?
    var button: CMButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
        
    }
    
    func initialize() {
        
        // 标签
        self.label = CMLabel(frame: CGRect(x: 12, y: 8, width: 200, height: 20), title: self.labelText, color: labelColor, sizeTitle: labelSize)
        self.addSubview(label!)
        
        // 键盘
        self.tf = CMTextField(frame: CGRect(x: 12, y: 8+label!.frame.height, width: 200, height: 20), title: textFieldTitle, color: textFieldColor, sizeTitle: textFieldSize)
        tf?.doWhatForBeginEditing = doWhatForBeginEditing
        tf?.doWhatForShouldReturn = doWhatForShouldReturn
        self.addSubview(tf!)
        
        // 底线
        let frame = CGRect(x: 12, y: 8+8+label!.frame.height+tf!.frame.height, width: self.frame.size.width - 24, height: 1)
        self.viewLine = CMLineView(frame: frame, backgroundColor: lineColor)
        self.addSubview(viewLine!)
        
        
        // 按钮
        self.button = CMButton(title: self.buttonTitle, image: self.backgroundImage, block: { 
            
        })
        self.button?.doWhat = buttonDoWhat
        self.button?.frame = CGRect(x: self.frame.width - 13 - 22, y: 8+label!.frame.height, width: buttonSize.width, height: buttonSize.height)
        self.addSubview(self.button!)

        let tap = UITapGestureRecognizer(target: self, action:  #selector(self.gesAction(sender:)))
        self.addGestureRecognizer(tap)

    }
    

    convenience init(frame: CGRect, labelTitle: String, labelColor: UIColor, labelSize: CGFloat,lineColor: UIColor,lineHeight: CGFloat,buttonDoWhat: @escaping ButtonDoWhat,doWhatForBeginEditing: @escaping DoWhatForBeginEditing) {
        self.init(frame: frame)
        
//        let label = CMLabel(frame: CGRect(x: 12, y: 8, width: 200, height: 20), title: labelTitle, color: labelColor, sizeTitle: labelSize)
//        self.addSubview(label)
//        
//        let tf = CMTextField(frame: CGRect(x: 12, y: 8+8+label.frame.height, width: 200, height: 20), title: "520.1414", color: UIColor.red, sizeTitle: 16)
//        self.addSubview(tf)
//        
//        tf.doWhatForBeginEditing = {
//            doWhatForBeginEditing()
//        }
//        
//        tf.doWhatForShouldReturn = {
//            self.doWhatForShouldReturn?()
//        }
//        
//        let frame = CGRect(x: 12, y: 8+8+8+label.frame.height+tf.frame.height, width: self.frame.size.width - 24, height: lineHeight)
//        let viewLine = CMLineView(frame: frame, backgroundColor: lineColor)
//        self.addSubview(viewLine)
//        
//        
//        
//        let button = CMButton(image: #imageLiteral(resourceName: "logo_black_sm")) {
//            buttonDoWhat()
//        }
//        
//        button.frame = CGRect(x: self.frame.width - 13 - 22, y: 8+8+label.frame.height, width: 26, height: 26)
//        self.addSubview(button)
//
//        let tap = UITapGestureRecognizer(target: self, action:  #selector(self.gesAction(sender:)))
//        self.addGestureRecognizer(tap)

    }
    
    
    convenience init(textFieldEnable: Bool,frame: CGRect, labelTitle: String, labelColor: UIColor, labelSize: CGFloat,lineColor: UIColor,lineHeight: CGFloat,buttonDoWhat: @escaping ButtonDoWhat) {
        self.init(frame: frame)
        
//        let label = CMLabel(frame: CGRect(x: 12, y: 8, width: 200, height: 20), title: labelTitle, color: labelColor, sizeTitle: labelSize)
//        self.addSubview(label)
//        
//        let tf = CMTextField(frame: CGRect(x: 12, y: 8+8+label.frame.height, width: 200, height: 20), title: "520.1314", color: UIColor.red, sizeTitle: 16)
//        self.addSubview(tf)
//        
//        tf.isEnabled = textFieldEnable
//        
////        tf.doWhatForBeginEditing = {
////            doWhatForBeginEditing()
////        }
////        
////        tf.doWhatForShouldReturn = {
////            self.doWhatForShouldReturn?()
////        }
//        
//        let frame = CGRect(x: 12, y: 8+8+8+label.frame.height+tf.frame.height, width: self.frame.size.width - 24, height: lineHeight)
//        let viewLine = CMLineView(frame: frame, backgroundColor: lineColor)
//        self.addSubview(viewLine)
//        
//        
//        
//        let button = CMButton(image: #imageLiteral(resourceName: "logo_black_sm")) {
//            buttonDoWhat()
//        }
//        
//        button.frame = CGRect(x: self.frame.width - 13 - 22, y: 8+8+label.frame.height, width: 26, height: 26)
//        self.addSubview(button)
        
        
        
        
        
    }


    // 触摸执行方法
    func gesAction(sender: UIGestureRecognizer) {
        tapDoWhat?()
    }

    
}
