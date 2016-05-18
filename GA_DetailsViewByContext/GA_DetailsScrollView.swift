//
//  GA_DetailsScrollView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/17.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DetailsScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.userInteractionEnabled = true
        self.backgroundColor = UIColor.clearColor()
        createUI(frame)
    }

    func createUI(frame: CGRect) {
        let (w, h) = (frame.size.width, frame.size.height)

        self.contentSize = CGSizeMake(w, h * 2)
        
        let backView = GA_DetailsBackgroundView(frame: CGRectMake(0, 0, w, self.contentSize.height), scrollView: self)
        self.addSubview(backView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}