## Objective

The objective of this repository is to illustrate how to use a `WKWebView`
component to access a page integrating with Viafoura in order to use the social
login capability Viafoura provides.

When developing an app in iOS that includes a `WKWebView` component, a few
additional steps are needed to ensure that the social login functionality that
Viafoura provides functions properly.

This README and repository describes what to do, why it needs to be done, and
includes source code examples.

## Why

The iOS `WKWebView` component provides a subset of the functionality of the iOS
Safari browser, and provides a means to navigate to and control a web page. The
`WKWebView`'s behavior deviates from regular browsers in the way that it manages
popup windows.

The `WKWebView` component's management of popup windows is not the same as
typical browsers such that a popup window is loaded in place of the current
document. Rather than opening a popup in a separate window, the `WKWebView`
replaces the current page with the popup content, while not retaining an
'opener' link to the original page.

Viafoura's social login process requires a popup window to manage the
authentication process with the appropriate social network. Once the social
network has authorized a user's credentials, the popup window is closed, and the
originating site will now be logged into Viafoura.

## Implementation

Please examine [iOS-Webview-sample/iOS-Webview-sample/ViewController.swift
](iOS-Webview-sample/iOS-Webview-sample/ViewController.swift)
for a sample implementation which enables Viafoura social login to work as
expected.

The `WKWebView`'s controller must:

1. Implement the `WKUIDelegate` and `WKNavigationDelegate` protocols
2. Implement `webViewDidClose` to allow popups to close
3. Implement `func webView(_ webView: WKWebView, createWebViewWith configuration:
WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures:
WKWindowFeatures)` and open a new webview as a subview for URLs at
`"https://auth.viafoura.io"`

### Other Issues

There may potentially be other issues that appear when attempting to implement
Viafoura's tools in a `WKWebView`.

[Contact our support team at support@viafoura.com for more information and
assistance](mailto:support@viafoura.com).
