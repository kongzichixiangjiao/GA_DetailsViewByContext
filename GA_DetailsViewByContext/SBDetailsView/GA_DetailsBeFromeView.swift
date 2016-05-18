//
//  GA_DetailsBeFromeView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/18.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DetailsBeFromeView: UIView {
   
    @IBOutlet weak var beFromeImageView: UIImageView!
    @IBOutlet weak var beFromeLabel: UILabel!
    
    class func createView() -> GA_DetailsBeFromeView {
        return NSBundle.mainBundle().loadNibNamed("GA_DetailsBeFromeView", owner: self, options: nil).last as! GA_DetailsBeFromeView
    }
    
}
