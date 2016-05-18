//
//  GA_DetailsView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/17.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DetailsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        let i = UIImage(named: "test.jpg")
        let imageView = GA_DetailsBlurtView(frame: self.bounds, i: i!)
        self.addSubview(imageView)
        
        let s = GA_DetailsScrollView(frame: self.bounds)
        self.addSubview(s)
    }
    
    override func drawRect(rect: CGRect) {
        drawText(rect)
    }
    
    func drawText(rect: CGRect) {
        let _: CGFloat = 0
        let _: CGFloat = 0
        let w = rect.size.width
        let h = rect.size.height
        let text = "UIGraphicsGetCurrentContextUIGraphicsGetCurrentContext"
        let context = UIGraphicsGetCurrentContext()
        //画文字
        //翻转当前的坐标系（因为对于底层绘制引擎来说，屏幕左下角为（0，0））
        CGContextSetTextMatrix(context, CGAffineTransformIdentity)
        CGContextTranslateCTM(context, 0, self.bounds.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        let path = CGPathCreateMutable();
        //设置path点的时候屏幕左下角为（0，0）即使上面翻转过。
        CGPathMoveToPoint(path, nil, 0, 0)
        CGPathAddLineToPoint(path, nil, 0, h)
        CGPathAddLineToPoint(path, nil, w , h)
        CGPathAddLineToPoint(path, nil, w, 0)
        CGPathCloseSubpath(path)
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(12), range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, attrString.length))
        let style                 = NSMutableParagraphStyle()
        style.lineSpacing        = 5.0 //每行文字之间的距离
        style.paragraphSpacing    = 0.0 //段落之间的距离
        style.headIndent          = 0.0 //每一行前面缩进的距离
        style.firstLineHeadIndent = 0.0 //每段开头缩进
        style.alignment          = .Center
        attrString.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSMakeRange(0, text.characters.count))
        let frameSetter = CTFramesetterCreateWithAttributedString(attrString as CFAttributedString)
        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, text.characters.count), path, nil)
        
        CTFrameDraw(frame, context!)
        
    }
}