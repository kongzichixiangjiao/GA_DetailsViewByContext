//
//  GA_DetailsDressView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/18.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DetailsCoordinateView: UIView {

    @IBOutlet weak var dressLabel: UILabel!
    
    class func createView() -> GA_DetailsCoordinateView {
        return NSBundle.mainBundle().loadNibNamed("GA_DetailsCoordinateView", owner: self, options: nil).last as! GA_DetailsCoordinateView
    }
    
    func setup() {
        dressLabel.text = "地址"
    }
}
