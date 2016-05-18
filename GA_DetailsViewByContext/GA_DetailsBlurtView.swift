//
//  GA_DetailsBlurtView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/18.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DetailsBlurtView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(frame: CGRect, i: UIImage) {
        self.init(frame: frame)
        self.image = i.stackBlur(90)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
