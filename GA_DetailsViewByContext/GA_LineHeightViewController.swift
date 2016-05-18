//
//  GA_LineHeightViewController.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/17.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_LineHeightViewController: UIViewController {

    @IBOutlet weak var attributedLabel: UILabel!
    @IBOutlet weak var label: GA_LineHeightLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "GA_LineHeightLabelGA_LineHeightLabelGA_LineHeightLabelGA_LineHeightLabelGA_Line1Hei"
        let l = GA_LineHeightLabel(frame: CGRectMake(20, 100, 100, 1000))
        l.text = str
        self.view.addSubview(l)
        l.numberOfLines = 0
        l.backgroundColor = UIColor.orangeColor()
        
        label.text = str
        
        
        let l1 = GA_LineHeightLabel(frame: CGRectMake(20, 220, 100, 1000))
        l1.text = "我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字"
        self.view.addSubview(l)
        l1.numberOfLines = 0
        let attrString = NSMutableAttributedString(string: "我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字")
        attributedLabel.text = "我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字我是汉字"
    }

}
