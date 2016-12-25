//
//  ViewController.swift
//  LYPlaceholderTextView
//
//  Created by joinhov on 2016/11/18.
//  Copyright © 2016年 joinhov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: LYPlaceholderTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.placeholder = "c测试输出口"
        
    }
    
    @IBAction func action(sender: UIButton) {
        
        textView.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



