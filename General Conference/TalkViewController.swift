//
//  TalkViewController.swift
//  General Conference
//
//  Created by Misha Milovidov on 12/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit
import WebKit

class TalkViewController : UIViewController {
    
    // MARK: - Properties
    
    var talk: Talk!
    
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - View controller lifecycle
    
    override func loadView() {
        let webViewConfiguration = WKWebViewConfiguration()
        
        webViewConfiguration.preferences.javaScriptEnabled = false
        
        webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL (string: talk.url!)
        let requestObj = URLRequest(url: url!)
        webView.load(requestObj)
    }
    
}
