//
//  ViewController.swift
//  iOS-Webview-sample
//
//  Created by Dougal Graham on 2019-10-02.
//  Copyright © 2019 Viafoura. All rights reserved.
//

import UIKit
import WebKit

// Note usage of WKUIDelegate, WKNavigationDelegate
class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        super.viewDidLoad()
        let url = URL(string: "***URL TO YOUR COMMENTS PAGE HERE***");
        let urlRequest = URLRequest(url: url!);
        
        webView.load(urlRequest);
    }
    
    // This is required to allow social login popups to close
    func webViewDidClose(_ webView: WKWebView) {
        webView.removeFromSuperview();
    }
    
    // Implement a custom handler for createWebViewWith hook to allow popup creation
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            let tempURL = navigationAction.request.url;
            var components = URLComponents();
            components.scheme = tempURL?.scheme;
            components.host = tempURL?.host;
            components.path = (tempURL?.path)!;
            
            // If the target URL is viafoura's authentication service, then we want to open it in a new tab of the
            // existing webview
            if (components.url?.absoluteString.contains("https://auth.viafoura.io") ?? false) {
                let socialLoginView = WKWebView(frame: self.view.bounds, configuration: configuration);
                socialLoginView.uiDelegate = self;
                socialLoginView.navigationDelegate = self;
                self.view.addSubview(socialLoginView);
                return socialLoginView;
            }
            else {
                webView.load(navigationAction.request)
            }
        }
        return nil
    }
    
    // ...
    // You should also include all the other various handlers for alerts, warnings, etc.

}

