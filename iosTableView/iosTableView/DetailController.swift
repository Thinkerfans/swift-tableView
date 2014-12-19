//
//  File.swift
//  iosTableView
//
//  Created by apple on 14-12-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

import UIKit
class DetailController: UIViewController {
    
    
    @IBOutlet weak var labelView: UILabel!
   
   var data: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
               println("File ")
        initViews()
    }
    
    func initViews(){
        
        labelView.text = data
    }
}
