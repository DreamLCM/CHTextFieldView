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
        
        let cmView = CMView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 74), labelTitle: "Avalible (BTC)", labelColor: UIColor.black, labelSize: 14)
        self.view.addSubview(cmView)
        
        cmView.doWhat = {
            print("惦记")
        }
        
        cmView.doWhatForBeginEditing = {
            print("编辑键盘")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

