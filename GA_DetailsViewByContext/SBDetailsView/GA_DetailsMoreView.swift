//
//  GA_DetailsMoreView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/18.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DetailsMoreView: UIView {

    class func createView() -> GA_DetailsMoreView {
        return NSBundle.mainBundle().loadNibNamed("GA_DetailsMoreView", owner: self, options: nil).last as! GA_DetailsMoreView
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(#file)
        print(#function)
        print(#line)
    }
    

}
