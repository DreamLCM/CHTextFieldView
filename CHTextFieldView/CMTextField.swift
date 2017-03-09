//
//  CMTextField.swift
//  CHTextFieldView
//
//  Created by CM on 2017/3/7.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMTextField: UITextField, UITextFieldDelegate {

    typealias DoWhatForBeginEditing = () -> Void
    var doWhatForBeginEditing: DoWhatForBeginEditing?
    
    typealias DoWhatForShouldReturn = () -> Void
    var doWhatForShouldReturn: DoWhatForShouldReturn?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    convenience init(frame: CGRect, title: String, color: UIColor, sizeTitle: CGFloat) {
        self.init(frame: frame)
        self.text = title
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: sizeTitle)
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.doWhatForBeginEditing?()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.doWhatForShouldReturn?()
        return true
    }
    
    
}
