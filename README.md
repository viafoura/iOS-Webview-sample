## This Project

Using Viafoura's tools in a webview may present some issues. A sample implementation can be found  in this repository that addresses certain issues you may experience when working with `WKWebView`s.

### Social Login

 Viafoura Social Login utilizes a popup window in order to complete the oAuth redirect flow. By default `WKWebView` 
does not enable popups.

[Please examine iOS-Webview-sample/iOS-Webview-sample/ViewController.swift](iOS-Webview-sample/iOS-Webview-sample/ViewController.swift)
for a sample implementation which enables Viafoura social login to work as expected.

The `WKWebView`'s controller must:

1. Implement the `WKUIDelegate` and `WKNavigationDelegate` protocols
1. Implement `webViewDidClose` to allow popups to close
1. Implement `func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures)` and open a new webview as a subview for URLs at `"https://auth.viafoura.io"`

### Other Issues

There may be other issues that appear when attempting to implement Viafoura's tools in a `WKWebView`.

[Contact our support team at support@viafoura.com for more information and assistance](mailto:support@viafoura.com).
