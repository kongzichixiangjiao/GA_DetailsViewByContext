//
//  GA_WebView.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/17.
//  Copyright © 2016年 houjianan. All rights reserved.
//

/*
 
 使用：
 let w = GA_WebView(frame: self.view.bounds)
 self.view.addSubview(w)
 //注意数据源的图片url   "\"http://a.hiphotos.baidu.com/image/pic/item/574e9258d109b3de643c7652cbbf6c81800a4c0d.jpg\""
 w.data = [["img" : "\"http://a.hiphotos.baidu.com/image/pic/item/574e9258d109b3de643c7652cbbf6c81800a4c0d.jpg\""], ["txt" : "我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊"], ["txt" : "我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊"], ["img" : "\"http://a.hiphotos.baidu.com/image/pic/item/574e9258d109b3de643c7652cbbf6c81800a4c0d.jpg\""], ["img" : "\"http://a.hiphotos.baidu.com/image/pic/item/574e9258d109b3de643c7652cbbf6c81800a4c0d.jpg\""], ["txt" : "我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊我是而是 啊啊啊啊啊啊啊"]]
 w.loadHTMLString(w.HTMLString(), baseURL: nil)
 */

import UIKit

protocol GA_WebViewDelegate {
    func webViewDidFinishLoad(contentSizeHeight: CGFloat)
}

class GA_WebView: UIWebView, UIWebViewDelegate {

    var myDelegate: GA_WebViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //一个简单的提示
    var l: UILabel!
    func webViewDidStartLoad(webView: UIWebView) {
        let w: CGFloat = 100
        let h: CGFloat = 30
        let x = self.frame.size.width / 2 - w / 2
        let y = self.frame.size.height / 2 - h / 2
        l = UILabel(frame: CGRectMake(x, y, w, h))
        l.backgroundColor = UIColor.orangeColor()
        l.textAlignment = .Center
        self.addSubview(l)
        l.text = "开始加载"
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        l.text = "开始完成"
        self.performSelector(#selector(GA_WebView.remove), withObject: self, afterDelay: 1)
        myDelegate.webViewDidFinishLoad(webView.scrollView.contentSize.height)
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        l.text = "开始失败"
    }
    
    func remove() {
        l.removeFromSuperview()
    }
    
    private let imageWidth: String = "90%"
    private let fontSize: String = "14px"
    private let fontColor: String = "#007AFF"
    private let lineHeight: String = "24px" //行间距
    private let imageMarginTop: String = "60px" //图片距离上的高度
    private let imageMarginBottom: String = "60px" //图片距离下的高度
    var data: [[String : String]] = [["":""]] //数据源
    
    
    func HTMLString() -> String {
        return baseHTMLString(headHTMLString(styleHTMLString(), bodyHTMLString: bodyDIVString()))
    }
    
    private func baseHTMLString(headHTMLString: String) -> String {
        return "<!DOCTYPE html><html>" + headHTMLString + "</html>";
    }
    
    private func headHTMLString(styleHTMLString: String, bodyHTMLString: String) -> String {
        return "<head><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no\" /><title></title>" + styleHTMLString +  bodyHTMLString + "</head>"
    }
    //css样式代码
    private func styleHTMLString() -> String {
        return "<style type=\"text/css\">body {margin: 0px;padding: 0px;}.out {width:100%;height: 50%;margin-bottom: "+imageMarginBottom+";margin-top: "+imageMarginTop+";text-align: center;}#text {width: 90%;margin-left: 5%;}p {text-indent:2em;color: "+fontColor+";font-size: "+fontSize+";line-height: "+lineHeight+";}img {width: "+imageWidth+";}</style>"
    }
    //将图片和文字的html代码拼接起来
    private func bodyDIVString() -> String {
        var bodyString: String = ""
        for d in data {
            switch d.keys.first! {
            case "img":
                bodyString = bodyString + getImageDIV(d["img"]!)
            case "txt":
                bodyString = bodyString + getTextDIV(d["txt"]!)
            default:
                break
            }
        }
        return "<body><div>"  + bodyString + "</div></body>"
    }
    //拼接图片的html代码
    private func getImageDIV(URL: String) -> String {
        return "<div class=\"out\"><img src=" + URL + "/></div>"
    }
    //拼接文字的html代码
    private func getTextDIV(text: String) -> String {
        return "<div id=\"text\"><p>" + text + "</p></div>"
    }
}