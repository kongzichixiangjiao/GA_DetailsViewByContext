//
//  GA_DetailsBackgroundView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/18.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_DetailsBackgroundView: UIView {

    private let spacing: CGFloat = 26
    var scrollView: GA_DetailsScrollView!
    var views: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, scrollView: GA_DetailsScrollView) {
        self.init(frame: frame)
        self.scrollView = scrollView
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        let w = self.frame.size.width
        //坐标，距离
        let coordinateView = GA_DetailsCoordinateView.createView()
        coordinateView.frame = CGRectMake(0, 200, w, 75)
        coordinateView.setup()
        self.addSubview(coordinateView)
        //标题，地点，费用
        let dressView = GA_DetailsDressView(frame: CGRectMake(0, CGRectGetMaxY(coordinateView.frame) + spacing, w, 20))
        dressView.setup()
        self.addSubview(dressView)
        //单独一张图
        let pH = w * w / UIWindow().screen.bounds.height
        let pictureView = UIImageView(frame: CGRectMake(0, CGRectGetMaxY(dressView.frame) + spacing, w, pH))
        let i = UIImage(named: "test.jpg")
        pictureView.image = i
        self.addSubview(pictureView)
        //内容介绍
        let contentTitleView = GA_DetailsClassView.createView()
        contentTitleView.frame = CGRectMake(0, CGRectGetMaxY(pictureView.frame) + spacing, w, 55)
        contentTitleView.isHideLineView = true
        contentTitleView.classTitleLabel.text = "内容介绍"
        self.addSubview(contentTitleView)
        
        let imageTextView = UIView()
        imageTextView.backgroundColor = UIColor.whiteColor()
        let iTSpacing: CGFloat = 15
        for i in 0..<2 {
            if i == 0 {
                let pictureView = UIImageView(frame: CGRectMake(iTSpacing, iTSpacing, w - iTSpacing * 2, pH))
                let i = UIImage(named: "test.jpg")
                pictureView.image = i
                views.append(pictureView)
                imageTextView.addSubview(pictureView)
            } else {
                let dressLabel = GA_LineHeightLabel(frame: CGRectMake(spacing, CGRectGetMaxY(views[i - 1].frame) + iTSpacing, w - iTSpacing * 2 ,20))
                dressLabel.myFont = UIFont.systemFontOfSize(12)
                dressLabel.lineSpace = 10
                dressLabel.numberOfLines = 0
                dressLabel.text = "我是地点我是地点我是地点我是地点我是地点我是地点我是地点我是地点我是地点我"
                views.append(dressLabel)
                imageTextView.addSubview(dressLabel)
            }
        }
        imageTextView.frame = CGRectMake(0, CGRectGetMaxY(contentTitleView.frame), w, CGRectGetMaxY(views.last!.frame) + iTSpacing)
        self.addSubview(imageTextView)
        //图文
        
        /*
        let webView = GA_WebView(frame: CGRectMake(0, CGRectGetMaxY(contentTitleView.frame), w, 250))
        webView.backgroundColor = UIColor.redColor()
        webView.tag = 2002
        
        webView.data = [["img" : "\"http://a.hiphotos.baidu.com/image/pic/item/574e9258d109b3de643c7652cbbf6c81800a4c0d.jpg\""], ["txt" : "我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊"], ["img" : "\"http://a.hiphotos.baidu.com/image/pic/item/574e9258d109b3de643c7652cbbf6c81800a4c0d.jpg\""], ["txt" : "我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊"]]
        webView.loadHTMLString(webView.HTMLString(), baseURL: nil)
        webView.myDelegate = self
        self.addSubview(webView)
         */
        //用户评论
        let conmentTitleView = GA_DetailsClassView.createView()
        conmentTitleView.frame = CGRectMake(0, CGRectGetMaxY(imageTextView.frame) + spacing, w, 55)
        conmentTitleView.classTitleLabel.text = "用户评论:"
        views.append(conmentTitleView)
        self.addSubview(conmentTitleView)
        //用户评论内容
        let conmentView = GA_DetailsConmentView(frame: CGRectMake(0, CGRectGetMaxY(conmentTitleView.frame), w, 0))
        conmentView.y = CGRectGetMaxY(conmentTitleView.frame)
        views.append(conmentView)
        self.addSubview(conmentView)
        
        let conmentView1 = GA_DetailsConmentView(frame: CGRectMake(0, CGRectGetMaxY(conmentView.frame), w, 0))
        conmentView1.y = CGRectGetMaxY(conmentView.frame)
        views.append(conmentView1)
        self.addSubview(conmentView1)
        //联系方式 更多详情
        let mH: CGFloat = 55
        let moreView = GA_DetailsMoreView.createView()
        moreView.frame = CGRectMake(0, CGRectGetMaxY(views.last!.frame) + spacing, w, mH)
        moreView.tag = 2001
        views.append(moreView)
        self.addSubview(moreView)
        //结果来自
        let bH: CGFloat = 111
        let beFromeView = GA_DetailsBeFromeView.createView()
        beFromeView.frame = CGRectMake(0, CGRectGetMaxY(moreView.frame) + spacing, w, bH)
        views.append(beFromeView)
        self.addSubview(beFromeView)
        
        setupScrollViewContentSize()
    }
    
    func setupScrollViewContentSize() {
        let w = self.frame.size.width
        let lastView = views.last
        scrollView.contentSize = CGSizeMake(w, CGRectGetMaxY(lastView!.frame) + spacing)
    }
    
}

extension GA_DetailsBackgroundView: GA_WebViewDelegate {

    func webViewDidFinishLoad(contentSizeHeight: CGFloat) {
        let w = self.frame.size.width
        let webView = self.viewWithTag(2002)
        webView?.frame = CGRectMake(0, webView!.frame.origin.y, w, contentSizeHeight)
        loop: for i in 0..<views.count {
            if i == 0 {
                views[i].frame = CGRectMake(0, CGRectGetMaxY(webView!.frame) + spacing, w, views[i].frame.size.height)
            } else {
                var spacing: CGFloat = 26
                if let _: GA_DetailsConmentView = views[i] as? GA_DetailsConmentView {
                    spacing = 0
                }
                views[i].frame = CGRectMake(0, CGRectGetMaxY(views[i - 1].frame) + spacing, w, views[i].frame.size.height)
            }
        }

        setupScrollViewContentSize()
    }
}
