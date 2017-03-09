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
    
    var labelConstantLeft:CGFloat = 8 {
        didSet {
            self.setConstantForLabel(left: labelConstantLeft, bottom: labelConstantBottom)
        }
    }
    
    var labelConstantBottom:CGFloat = -8 {
        didSet {
            self.setConstantForLabel(left: labelConstantLeft, bottom: labelConstantBottom)
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
    
    // 距左
    var tfConstantLeft: CGFloat = 8 {
        didSet {
            self.setConstantForTF(left: self.tfConstantLeft,
                                  centerY: tfConstantCenterY,
                                  width: tfConstantWidth,
                                  height: tfConstantHeight)
        }
        
    }
    
    // 距中
    var tfConstantCenterY: CGFloat = 0 {
        didSet {
            self.setConstantForTF(left: self.tfConstantLeft,
                                  centerY: tfConstantCenterY,
                                  width: tfConstantWidth,
                                  height: tfConstantHeight)
        }
    }
    
    // 宽度
    var tfConstantWidth: CGFloat = 200 {
        didSet {
            self.setConstantForTF(left: self.tfConstantLeft,
                                  centerY: tfConstantCenterY,
                                  width: tfConstantWidth,
                                  height: tfConstantHeight)
        }
    }
    
    // 高度
    var tfConstantHeight: CGFloat = 25 {
        didSet {
            self.setConstantForTF(left: self.tfConstantLeft,
                                  centerY: tfConstantCenterY,
                                  width: tfConstantWidth,
                                  height: tfConstantHeight)
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
    
    var lineConstantLeft:CGFloat = 8 {
        didSet {
            self.setConstantForLine(left: lineConstantLeft,
                                    top: lineConstantTop,
                                    right: lineConstantRight,
                                    height: lineConstantHeight)
        }
    }
    
    var lineConstantRight: CGFloat = -8 {
        didSet {
            self.setConstantForLine(left: lineConstantLeft,
                                    top: lineConstantTop,
                                    right: lineConstantRight,
                                    height: lineConstantHeight)
        }
    }
    
    var lineConstantHeight: CGFloat = 1 {
        didSet {
            self.setConstantForLine(left: lineConstantLeft,
                                    top: lineConstantTop,
                                    right: lineConstantRight,
                                    height: lineConstantHeight)
        }
    }
    
    var lineConstantTop: CGFloat = 8 {
        didSet {
            self.setConstantForLine(left: lineConstantLeft,
                                    top: lineConstantTop,
                                    right: lineConstantRight,
                                    height: lineConstantHeight)
        }
    }
    
    //button 的属性
    var backgroundImage = UIImage() {
        didSet {
            self.button?.setImage(backgroundImage, for: .normal)
        }
    }
    
    var buttonTitle = "" {
        didSet {
            self.button?.setTitle(buttonTitle, for: .normal)
        }
    }
    
    var buttonConstantCenterY: CGFloat = 0 {
        didSet {
            self.setConstantForButton(centerY: buttonConstantCenterY,
                                      right: buttonConstantRight)
        }
    }
    
    var buttonConstantRight: CGFloat = 8 {
        didSet {
            self.setConstantForButton(centerY: buttonConstantCenterY,
                                      right: buttonConstantRight)
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
        
        self.tf = CMTextField(frame: CGRect.zero, title: "520.1414", color: UIColor.red, sizeTitle: 14)
        self.tf?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.tf!)
        
        self.viewLine = CMLineView(frame: frame, backgroundColor: lineColor)
        self.viewLine!.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.viewLine!)
        
        
        self.button = CMButton(title: self.buttonTitle, image: self.backgroundImage, block: {})
        self.button?.doWhat = buttonDoWhat
        self.button!.setTitle(buttonTitle, for: .normal)
        self.addSubview(self.button!)
        self.button!.translatesAutoresizingMaskIntoConstraints = false
        
        self.label = CMLabel(frame: CGRect.zero, title: self.labelText, color: labelColor, sizeTitle: labelSize)
        self.addSubview(self.label!)
        self.label!.translatesAutoresizingMaskIntoConstraints = false
        
        // 约束键盘
        self.setConstantForTF(left: self.tfConstantLeft,
                              centerY: self.tfConstantCenterY,
                              width: self.tfConstantWidth,
                              height: self.tfConstantHeight)
        
        self.setConstantForLabel(left: self.labelConstantLeft,
                                 bottom: self.labelConstantBottom)
        
        self.setConstantForLine(left: lineConstantLeft,
                                top: lineConstantTop,
                                right: lineConstantRight,
                                height: lineConstantHeight)
        
        self.setConstantForButton(centerY: self.buttonConstantCenterY,
                                  right: self.buttonConstantRight)
        
        
        
        let tap = UITapGestureRecognizer(target: self, action:  #selector(self.gesAction(sender:)))
        self.addGestureRecognizer(tap)

    }
    
    convenience init(frame: CGRect, labelTitle: String, labelColor: UIColor, labelSize: CGFloat,lineColor: UIColor,lineHeight: CGFloat,buttonDoWhat: @escaping ButtonDoWhat,doWhatForBeginEditing: @escaping DoWhatForBeginEditing) {
        self.init(frame: frame)
    
    }
    
    
    convenience init(textFieldEnable: Bool,frame: CGRect, labelTitle: String, labelColor: UIColor, labelSize: CGFloat,lineColor: UIColor,lineHeight: CGFloat,buttonDoWhat: @escaping ButtonDoWhat) {
        self.init(frame: frame)
        
        
    }

    /*
     **  tf约束
     */
    func setConstantForTF(left: CGFloat,centerY: CGFloat,width: CGFloat,height: CGFloat) {

        

        let textFieldLeft = NSLayoutConstraint(item: self.tf!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: left)
        
        let textFieldCenterY = NSLayoutConstraint(item: self.tf!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: centerY)
        
        let textFieldWidth = NSLayoutConstraint(item: self.tf!, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width)
        
        let textFieldHeight = NSLayoutConstraint(item: self.tf!, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        
        self.addConstraints([textFieldLeft,textFieldCenterY,textFieldWidth,textFieldHeight])

    }
    
    /*
     **  button约束
     */
    func setConstantForButton(centerY: CGFloat,right: CGFloat) {
        
        let buttonCenterY = NSLayoutConstraint(item: self.button!, attribute: .centerY, relatedBy: .equal, toItem: self.tf!, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        let buttonRight = NSLayoutConstraint(item: self.button!, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -8)
        
        self.addConstraints([buttonCenterY,buttonRight])
    }
    
    
    
    /*
     **  label约束
     */
    func setConstantForLabel(left: CGFloat,bottom: CGFloat) {
        
        // label 的约束
        let labelLeft = NSLayoutConstraint(item: self.label!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: left)
        
        let labelBottom = NSLayoutConstraint(item: self.label!, attribute: .bottom, relatedBy: .equal, toItem: self.tf, attribute: .top, multiplier: 1.0, constant: bottom)
        
        self.addConstraints([labelLeft,labelBottom])

    }
    
    
    /*
     **  线的约束
     */
    func setConstantForLine(left: CGFloat, top: CGFloat,right: CGFloat,height: CGFloat) {
        
        let viewLineLeft = NSLayoutConstraint(item: viewLine!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: left)
        
        let viewLineTop = NSLayoutConstraint(item: viewLine!, attribute: .top, relatedBy: .equal, toItem: self.tf, attribute: .bottom, multiplier: 1.0, constant: top)
        
        let viewLineRight = NSLayoutConstraint(item: viewLine!, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: right)
        
        let viewLineHeight = NSLayoutConstraint(item: self.viewLine!, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        self.addConstraints([viewLineLeft,viewLineTop,viewLineRight,viewLineHeight])
    }
    

    // 触摸执行方法
    func gesAction(sender: UIGestureRecognizer) {
        tapDoWhat?()
    }

    
}
