//
//  GA_DetailsConmentView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/18.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DetailsConmentView: UIView {
    
    var headImageView: UIImageView!
    var titleLabel: UILabel!
    var dateLabel: UILabel!
    var conmentLabel: GA_LineHeightLabel!
    var lineView: UIView!
    let cBottomSpacing: CGFloat = 25
    var y: CGFloat! {
        didSet {
            conmentLabel.text = "1啊啊啊我是而是 2啊啊啊啊啊啊啊我是而是 3啊啊啊啊啊啊啊我是而是 4啊啊啊啊啊啊啊我是而是 5啊啊啊啊啊啊啊我是而是 6啊啊啊啊啊啊啊我是而是 7啊啊啊啊啊啊啊我是而是 8啊啊啊啊啊啊啊我是而是 9啊啊啊啊啊啊啊"
            let w = frame.size.width
            let lLeftSpacing: CGFloat = 75
            self.frame = CGRectMake(0, y, w, CGRectGetMaxY(self.conmentLabel.frame) + cBottomSpacing)
            let h = frame.size.height
            self.lineView.frame = CGRectMake(lLeftSpacing, h - 1, w - lLeftSpacing, 1)
        }
    }
    
    class func createView() -> GA_DetailsConmentView {
        return NSBundle.mainBundle().loadNibNamed("GA_DetailsConmentView", owner: self, options: nil).last as! GA_DetailsConmentView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        let w = frame.size.width
        
        let spacing: CGFloat = 15
        headImageView = UIImageView(frame: CGRectMake(15, 23, 50, 50))
        headImageView.backgroundColor = UIColor.orangeColor()
        self.addSubview(headImageView)
        
        let dW: CGFloat = 50
        dateLabel = UILabel(frame: CGRectMake(w - dW - spacing, 26, dW, 16))
        dateLabel.font = UIFont.systemFontOfSize(10)
        dateLabel.textColor = UIColor.lightGrayColor()
        dateLabel.textAlignment = .Right
        dateLabel.text = "12：12"
        self.addSubview(dateLabel)
        
        let tW = w - CGRectGetMaxX(headImageView.frame) - dW
        titleLabel = UILabel(frame: CGRectMake(CGRectGetMaxX(headImageView.frame) + spacing, 26, tW, 22))
        titleLabel.text = "小怪物达斯奥特曼"
        self.addSubview(titleLabel)
        
        let cX = titleLabel.frame.origin.x
        let cY = CGRectGetMaxY(titleLabel.frame) + 12
        let cW = CGRectGetMinX(dateLabel.frame) - CGRectGetMinX(titleLabel.frame)
        let cH: CGFloat = 0
        conmentLabel = GA_LineHeightLabel(frame: CGRectMake(cX, cY, cW, cH))
        conmentLabel.myFont = UIFont.systemFontOfSize(14)
        conmentLabel.lineSpace = 9
        conmentLabel.numberOfLines = 0
        self.addSubview(conmentLabel)
        
         self.lineView = UIView(frame: CGRectMake(0, 0, 0, 1))
        lineView.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(lineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
