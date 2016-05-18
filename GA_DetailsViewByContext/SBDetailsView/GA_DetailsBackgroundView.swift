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
        let coordinateView = GA_DetailsCoordinateView.createView()
        coordinateView.frame = CGRectMake(0, 200, w, 75)
        coordinateView.setup()
        self.addSubview(coordinateView)
        
        let dressView = GA_DetailsDressView(frame: CGRectMake(0, CGRectGetMaxY(coordinateView.frame) + spacing, w, 20))
        dressView.setup()
        self.addSubview(dressView)
        
        let pH = w * w / UIWindow().screen.bounds.height
        let pictureView = UIImageView(frame: CGRectMake(0, CGRectGetMaxY(dressView.frame) + spacing, w, pH))
        let i = UIImage(named: "test.jpg")
        pictureView.image = i
        self.addSubview(pictureView)
        
        let contentTitleView = GA_DetailsClassView.createView()
        contentTitleView.frame = CGRectMake(0, CGRectGetMaxY(pictureView.frame) + spacing, w, 55)
        contentTitleView.isHideLineView = true
        contentTitleView.classTitleLabel.text = "内容介绍"
        self.addSubview(contentTitleView)
        
        let webView = GA_WebView(frame: CGRectMake(0, CGRectGetMaxY(contentTitleView.frame), w, 250))
        webView.backgroundColor = UIColor.redColor()
        webView.tag = 2002
        
        webView.data = [["img" : "\"http://a.hiphotos.baidu.com/image/pic/item/574e9258d109b3de643c7652cbbf6c81800a4c0d.jpg\""], ["txt" : "我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊"], ["img" : "\"http://a.hiphotos.baidu.com/image/pic/item/574e9258d109b3de643c7652cbbf6c81800a4c0d.jpg\""], ["txt" : "我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊"]]
        webView.loadHTMLString(webView.HTMLString(), baseURL: nil)
        webView.myDelegate = self
        self.addSubview(webView)
        
        let conmentTitleView = GA_DetailsClassView.createView()
        conmentTitleView.frame = CGRectMake(0, CGRectGetMaxY(webView.frame) + spacing, w, 55)
        conmentTitleView.classTitleLabel.text = "用户评论:"
        views.append(conmentTitleView)
        self.addSubview(conmentTitleView)

        let conmentView = GA_DetailsConmentView(frame: CGRectMake(0, CGRectGetMaxY(conmentTitleView.frame), w, 0))
        conmentView.y = CGRectGetMaxY(conmentTitleView.frame)
        views.append(conmentView)
        self.addSubview(conmentView)
    
        let mH: CGFloat = 55
        let moreView = GA_DetailsMoreView.createView()
        moreView.frame = CGRectMake(0, CGRectGetMaxY(views.last!.frame) + spacing, w, mH)
        moreView.tag = 2001
        views.append(moreView)
        self.addSubview(moreView)
        
        let bH: CGFloat = 111
        let beFromeView = GA_DetailsBeFromeView.createView()
        beFromeView.frame = CGRectMake(0, CGRectGetMaxY(moreView.frame) + spacing, w, bH)
        views.append(beFromeView)
        self.addSubview(beFromeView)
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
