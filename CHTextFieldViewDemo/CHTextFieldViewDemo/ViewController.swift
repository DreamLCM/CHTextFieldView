//
//  ViewController.swift
//  CHTextFieldViewDemo
//
//  Created by CM on 2017/3/7.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewXib: CMView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 代码创建
        let frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 74)
        let cmView = CMView(frame: frame)
        cmView.backgroundImage = #imageLiteral(resourceName: "logo_black_sm")
        cmView.buttonDoWhat = {
            print("点击按钮")
        }
        self.view.addSubview(cmView)
        

        
        
        // xib 创建
        self.viewXib.labelColor = UIColor.brown
        self.viewXib.textFieldSize = 22
        self.viewXib.lineColor = UIColor.blue
        self.viewXib.textFieldIsEnable = false
        
        // 按钮背景
        self.viewXib.backgroundImage = #imageLiteral(resourceName: "logo_black_sm")
        
        // 按钮执行方法
        self.viewXib.buttonDoWhat = {
            print("点击按钮")
        }
        
        self.viewXib.doWhatForBeginEditing = {
            print("键盘弹出")
        }
        
        self.viewXib.doWhatForShouldReturn = {
            print("点击 return")
        }
        

        self.viewXib.tapDoWhat = {
            print("触摸")
        }
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

