//
//  Source.swift
//  iCatchUp
//
//  Created by Operador on 11/9/17.
//  Copyright © 2017 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Source {
    var id: String
    var name: String
    var description: String
    var url: String
    var category: String
    var language: String
    var country: String
    var sortBysAvailable: [String]
    init() {
        id = ""
        name = ""
        description = ""
        url = ""
        category = ""
        language = ""
        country = ""
        sortBysAvailable = []
    }
    
    init(from jsonObject: JSON) {
        id = jsonObject["id"].stringValue
        name = jsonObject["name"].stringValue
        description = jsonObject["description"].stringValue
        url = jsonObject["url"].stringValue
        category = jsonObject["category"].stringValue
        language = jsonObject["language"].stringValue
        country = jsonObject["country"].stringValue
        let jsonSortBysAvailable = jsonObject["sortBysAvailable"].arrayValue
        sortBysAvailable = []
        for i in 0...jsonSortBysAvailable.count - 1 {
            sortBysAvailable.append(jsonSortBysAvailable[i].stringValue)
        }
    }
    
    static func from(jsonSources: [JSON]) -> [Source] {
        var sources: [Source] = []
        let count = jsonSources.count
        for i in 0...count - 1 {
            sources.append(Source.init(from: jsonSources[i]))
        }
        return sources
    }
    
    
}
