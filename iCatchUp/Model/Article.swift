//
//  Article.swift
//  iCatchUp
//
//  Created by Operador on 11/9/17.
//  Copyright © 2017 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Article {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var source: Source?
    
    init() {
        author = ""
        title = ""
        description = ""
        url = ""
        urlToImage = ""
        publishedAt = ""
        source = nil
    }
    
    init(from jsonObject: JSON, withSource source: Source ) {
        author = jsonObject["author"].stringValue
        title = jsonObject["title"].stringValue
        description = jsonObject["description"].stringValue
        url = jsonObject["url"].stringValue
        urlToImage = jsonObject["urlToImage"].stringValue
        publishedAt = jsonObject["publishedAt"].stringValue
        self.source = source
    }
    
    static func from(jsonArticles: [JSON], withSource source: Source) {
        
    }
}
