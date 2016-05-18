//
//  GA_DressCell.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/17.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DressCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: GA_LineHeightLabel!
    @IBOutlet weak var dressLabel: GA_LineHeightLabel!
    @IBOutlet weak var costLabel: GA_LineHeightLabel! {
        didSet {
            
        }
    }
    
//    var cellHeight: CGFloat {
//        get {
//            return dressLabel.getLabelLastSize().height + titleLabel.getLabelLastSize().height + costLabel.getLabelLastSize().height
//        }
//    }
    
}
