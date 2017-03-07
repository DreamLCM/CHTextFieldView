//
//  ViewController.swift
//  CHTextFieldViewDemo
//
//  Created by CM on 2017/3/7.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 74)
        
        let cmView = CMView(frame: frame, labelTitle: "Avalible (BTC)", labelColor: UIColor.black, labelSize: 14, lineColor: UIColor.gray, lineHeight: 1, buttonDoWhat: {
            
            print("点击按钮")
            
        }) {
            print("编辑键盘")
            
        }
        
        self.view.addSubview(cmView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

