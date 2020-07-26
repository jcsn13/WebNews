//
//  WebView.swift
//  WebNews
//
//  Created by Cláudio on 07/06/20.
//  Copyright © 2020 Claudio Soares. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: View {
    
    let url:String?
    
    var body: some View {
        PageView(urlString: url)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "https://google.com")
    }
}

struct PageView: UIViewRepresentable {
    
    let urlString:String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString =  urlString{
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
