//
//  NetworkManager.swift
//  WebNews
//
//  Created by Cláudio on 07/06/20.
//  Copyright © 2020 Claudio Soares. All rights reserved.
//

import Foundation

class NetworkManager:ObservableObject{
    
    @Published var news = [News]()
    
    let apiKey = "5fb05695d11f49e8a3140643b0ee1d61"
    let baseUrl = "https://newsapi.org/v2/top-headlines?country=us"
    
    func fetchNews() {
        if let url = URL(string: "\(baseUrl)&apiKey=\(apiKey)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                if let safeData = data{
                    do{
                        let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.news = results.articles
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
