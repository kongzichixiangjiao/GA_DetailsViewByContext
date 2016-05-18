//
//  GA_DetailsClassView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/18.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DetailsClassView: UIView {

    @IBOutlet weak var classTitleLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    var isHideLineView: Bool? {
        didSet {
            if isHideLineView! {
                lineView.hidden = true
            }
        }
    }
    class func createView() -> GA_DetailsClassView {
        return NSBundle.mainBundle().loadNibNamed("GA_DetailsClassView", owner: self, options: nil).last as! GA_DetailsClassView
    }
}
