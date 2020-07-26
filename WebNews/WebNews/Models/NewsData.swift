//
//  NewsData.swift
//  WebNews
//
//  Created by Cláudio on 07/06/20.
//  Copyright © 2020 Claudio Soares. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let articles:[News]
}

struct News: Decodable, Identifiable {
    let id = UUID()
    let title:String
    let url:String
}
