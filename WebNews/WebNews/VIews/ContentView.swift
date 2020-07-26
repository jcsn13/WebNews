//
//  ContentView.swift
//  WebNews
//
//  Created by Cláudio on 07/06/20.
//  Copyright © 2020 Claudio Soares. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.news){ News in NavigationLink(destination: WebView(url: News.url)) {
                
                HStack {
                    Text(News.title)
                }
                
                }
                
            }
            .navigationBarTitle("WebNews", displayMode: .inline)
        }
        .onAppear {
            self.networkManager.fetchNews()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
