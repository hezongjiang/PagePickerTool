//
//  ViewController.swift
//  PagePickerDemo
//
//  Created by Hearsay on 2017/2/13.
//  Copyright © 2017年 Hearsay. All rights reserved.
//

import UIKit

class ViewController: PageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func setupChildVC() {
        
        titleLabelWidth = UIScreen.main.bounds.width / 3
        
        let vc1 = TableViewController()
        vc1.title = "国际"
        addChildViewController(vc1)
        
        let vc2 = TableViewController()
        vc2.title = "体育"
        addChildViewController(vc2)
        
        let vc3 = TableViewController()
        vc3.title = "娱乐"
        addChildViewController(vc3)
        
    }
}

