//
//  GA_LineHeightLabel.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/17.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_LineHeightLabel: UILabel {

    @IBInspectable var lineSpace: CGFloat = 10.0
    @IBInspectable var isXib: Bool = false
    @IBInspectable var myTextColor: UIColor! = UIColor.blackColor()
    @IBInspectable var myFontSize: CGFloat = 14
    @IBInspectable var myFirstLineHeadIndent: CGFloat = 0
    @IBInspectable var myFont: UIFont = UIFont.boldSystemFontOfSize(14)
    var lastSize: CGSize = CGSizeMake(0, 0)
    override var text: String? {
        didSet {
            setup()
        }
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        //画文字
        //翻转当前的坐标系（因为对于底层绘制引擎来说，屏幕左下角为（0，0））
        CGContextSetTextMatrix(context, CGAffineTransformIdentity)
        CGContextTranslateCTM(context, 0, self.bounds.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        let path = setLabelPath()
        let attrString = setAttributedString()
        let frameSetter = CTFramesetterCreateWithAttributedString(attrString as CFAttributedString)
        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, text!.characters.count), path, nil)
        
        CTFrameDraw(frame, context!)
    }

    func setLabelPath() -> CGMutablePath {
        let w = self.frame.size.width
        let h = self.frame.size.height
        let path = CGPathCreateMutable();
        //设置path点的时候屏幕左下角为（0，0）即使上面翻转过。
        CGPathMoveToPoint(path, nil, 0, 0)
        CGPathAddLineToPoint(path, nil, 0, h)
        CGPathAddLineToPoint(path, nil, w , h)
        CGPathAddLineToPoint(path, nil, w, 0)
        CGPathCloseSubpath(path)
        return path
    }
    
    func setAttributedString() -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: self.text!)
        attrString.addAttribute(NSFontAttributeName, value: myFont, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSForegroundColorAttributeName, value: myTextColor, range: NSMakeRange(0, attrString.length))
        let style                 = NSMutableParagraphStyle()
        style.lineSpacing         = lineSpace //每行文字之间的距离
        style.paragraphSpacing    = 0.0 //段落之间的距离
        style.headIndent          = 0.0 //每一行前面缩进的距离
        style.firstLineHeadIndent = myFirstLineHeadIndent //每段开头缩进
        style.alignment           = .Left
        attrString.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSMakeRange(0, text!.characters.count))
        return attrString
    }
 
    func setup() {
        if isXib {
            self.superview!.addConstraint(NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1, constant: self.getLabelLastSize().height))
        } else {
            self.frame.size = getLabelLastSize()
        }
    }

    func getLabelLastSize() -> CGSize {
        let attrString = setAttributedString()
        let frameSetter = CTFramesetterCreateWithAttributedString(attrString as CFAttributedString)
        let targetSize = CGSizeMake(self.frame.size.width, CGFloat(MAXFLOAT))
        let size = CTFramesetterSuggestFrameSizeWithConstraints(frameSetter, CFRangeMake(0, CFIndex(attrString.length)), nil, targetSize, nil)
        return size
    }
}
