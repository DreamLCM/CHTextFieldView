//
//  CMView.swift
//  CHTextFieldView
//
//  Created by CM on 2017/3/6.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit


@IBDesignable
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
    @IBInspectable public var labelColor = UIColor.blue {
        didSet {
            self.label?.textColor = self.labelColor
        }
    }
    
    @IBInspectable public var labelText = "Available" {
        didSet {
            self.label?.text = self.labelText
        }
    }
    
    @IBInspectable public var labelSize:CGFloat = 14 {
        didSet {
            self.label?.font = UIFont.systemFont(ofSize: labelSize)
        }
    }
    
    @IBInspectable public var labelLeft:CGFloat = 8 {
        didSet {
            self.setConstantForLabel(left: labelLeft, bottom: labelBottom)
        }
    }
    
    @IBInspectable public var labelBottom:CGFloat = -8 {
        didSet {
            self.setConstantForLabel(left: labelLeft, bottom: labelBottom)
        }
    }
    
    // textField 的属性
    @IBInspectable public var textFieldTitle = "520.1414" {
        didSet {
            self.tf?.text = textFieldTitle
        }
    }

    @IBInspectable public var textFieldSize: CGFloat = 16 {
        didSet {
            self.tf?.font = UIFont.systemFont(ofSize: textFieldSize)
        }
    }
    
    @IBInspectable public var textFieldColor = UIColor.red {
        didSet {
            self.tf?.textColor = textFieldColor
        }
    }
    
    // 距左
    @IBInspectable public var tfLeft: CGFloat = 8 {
        didSet {
            self.setConstantForTF(left: self.tfLeft,
                                  centerY: tfCenterY,
                                  width: tfWidth,
                                  height: tfHeight)
        }
        
    }
    
    // 距中
    @IBInspectable public var tfCenterY: CGFloat = 0 {
        didSet {
            self.setConstantForTF(left: self.tfLeft,
                                  centerY: tfCenterY,
                                  width: tfWidth,
                                  height: tfHeight)
        }
    }
    
    // 宽度
    @IBInspectable public var tfWidth: CGFloat = 200 {
        didSet {
            self.setConstantForTF(left: self.tfLeft,
                                  centerY: tfCenterY,
                                  width: tfWidth,
                                  height: tfHeight)
        }
    }
    
    // 高度
    @IBInspectable public var tfHeight: CGFloat = 25 {
        didSet {
            self.setConstantForTF(left: self.tfLeft,
                                  centerY: tfCenterY,
                                  width: tfWidth,
                                  height: tfHeight)
        }
    }
    
    // 等于 false时键盘点击无效
    @IBInspectable public var textFieldIsEnable = true {
        didSet {
            self.tf?.isEnabled = textFieldIsEnable
        }
    }
    
    //viewLine 的属性
    @IBInspectable public var lineColor = UIColor.gray {
        didSet {
            self.viewLine?.backgroundColor = lineColor
        }
    }
    
    @IBInspectable public  var lineLeft:CGFloat = 8 {
        didSet {
            self.setConstantForLine(left: lineLeft,
                                    top: lineTop,
                                    right: lineRight,
                                    height: lineHeight)
        }
    }
    
    @IBInspectable public var lineRight: CGFloat = -8 {
        didSet {
            self.setConstantForLine(left: lineLeft,
                                    top: lineTop,
                                    right: lineRight,
                                    height: lineHeight)
        }
    }
    
    @IBInspectable public var lineHeight: CGFloat = 1 {
        didSet {
            self.setConstantForLine(left: lineLeft,
                                    top: lineTop,
                                    right: lineRight,
                                    height: lineHeight)
        }
    }
    
    @IBInspectable public var lineTop: CGFloat = 8 {
        didSet {
            self.setConstantForLine(left: lineLeft,
                                    top: lineTop,
                                    right: lineRight,
                                    height: lineHeight)
        }
    }
    
    //button 的属性
    @IBInspectable public var backgroundImage = UIImage() {
        didSet {
            self.button?.setImage(backgroundImage, for: .normal)
        }
    }
    
    @IBInspectable public var buttonTitle = "" {
        didSet {
            self.button?.setTitle(buttonTitle, for: .normal)
        }
    }
    
   @IBInspectable public var buttonConstantCenterY: CGFloat = 0 {
        didSet {
            self.setConstantForButton(centerY: buttonConstantCenterY,
                                      right: buttonConstantRight)
        }
    }
    
    @IBInspectable public var buttonConstantRight: CGFloat = 8 {
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
        self.setConstantForTF(left: self.tfLeft,
                              centerY: self.tfCenterY,
                              width: self.tfWidth,
                              height: self.tfHeight)
        
        self.setConstantForLabel(left: self.labelLeft,
                                 bottom: self.labelBottom)
        
        self.setConstantForLine(left: lineLeft,
                                top: lineTop,
                                right: lineRight,
                                height: lineHeight)
        
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
