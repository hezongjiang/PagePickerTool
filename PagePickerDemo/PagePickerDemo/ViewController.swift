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
        
        let vc1 = TableViewController()
        vc1.title = "国际"
        addChildViewController(vc1)
        
        let vc2 = TableViewController()
        vc2.title = "体育"
        addChildViewController(vc2)
        
        let vc3 = TableViewController()
        vc3.title = "娱乐"
        addChildViewController(vc3)
        
        let vc4 = TableViewController()
        vc4.title = "音乐"
        addChildViewController(vc4)
        
        let vc5 = TableViewController()
        vc5.title = "健康"
        addChildViewController(vc5)
        
        let vc6 = TableViewController()
        vc6.title = "时事"
        addChildViewController(vc6)
        
        let vc7 = TableViewController()
        vc7.title = "国内"
        addChildViewController(vc7)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

