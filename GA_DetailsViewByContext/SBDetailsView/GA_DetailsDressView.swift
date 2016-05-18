//
//  GA_DetailsDressView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/18.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DetailsDressView: UIView {

    let topSpacing: CGFloat = 21
    let leftSpacing: CGFloat = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        let w = self.frame.size.width
        let titleLabel = GA_LineHeightLabel(frame: CGRectMake(leftSpacing, topSpacing,  w - leftSpacing ,0))
        titleLabel.myFont = UIFont.boldSystemFontOfSize(14)
        titleLabel.lineSpace = 9
        titleLabel.numberOfLines = 0
        titleLabel.text = "我是title我是title我是title我是title我是title我是title我是title我是title"
       
        self.addSubview(titleLabel)
        
        let pTopSpacing: CGFloat = 21
        let pX: CGFloat = 13
        let pY: CGFloat = pTopSpacing + CGRectGetMaxY(titleLabel.frame)
        let pW: CGFloat = 20
        let pH: CGFloat = 20
        let positionImageView = UIImageView(frame: CGRectMake(pX, pY, pW, pH))
        positionImageView.backgroundColor = UIColor.orangeColor()
        self.addSubview(positionImageView)
        
        let dTopSpacing: CGFloat = pTopSpacing + 2
        let dLeftSpacing: CGFloat = 7
        let dX: CGFloat = CGRectGetMaxX(positionImageView.frame) + dLeftSpacing
        let dY: CGFloat = dTopSpacing + CGRectGetMaxY(titleLabel.frame)
        let dW: CGFloat = w - dX
        let dH: CGFloat = 0
        let dressLabel = GA_LineHeightLabel(frame: CGRectMake(dX, dY,  dW ,dH))
        dressLabel.myFont = UIFont.systemFontOfSize(12)
        dressLabel.lineSpace = 8
        dressLabel.numberOfLines = 0
        dressLabel.text = "我是地点我是地点我是地点我是地点我是地点我是地点我是地点我是地点我是地点我"
        self.addSubview(dressLabel)
        
        let cTopSpacing: CGFloat = 15
        let cX: CGFloat = CGRectGetMinX(dressLabel.frame)
        let cY: CGFloat = cTopSpacing + CGRectGetMaxY(dressLabel.frame)
        let cW: CGFloat = w
        let cH: CGFloat = 0
        let costLabel = GA_LineHeightLabel(frame: CGRectMake(cX, cY, cW, cH))
        costLabel.myFont = UIFont.systemFontOfSize(12)
        costLabel.text = "费用：1998元"
        costLabel.tag = 1001
        self.addSubview(costLabel)
    }
    
    func setup() {
        let lastView = self.viewWithTag(1001)
        
        self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(lastView!.frame) + topSpacing)
    }
    
}
