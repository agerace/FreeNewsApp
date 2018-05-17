//
//  NewsSource.swift
//  FreeNewsApp
//
//  Created by andresgerace on 15/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import Foundation
import Jayme
import SwiftyJSON

struct NewsSource: Identifiable {
    let id: String
    let name: String
    let description: String
    let url: String
}

extension NewsSource: DictionaryInitializable, DictionaryRepresentable {
   
    init(dictionary: [AnyHashable : Any]) throws {
        let json = JSON(dictionary)
        guard let id = json["id"].string,
            let name = json["name"].string,
            let description = json["description"].string,
            let url = json["url"].string
            else {  throw JaymeError.parsingError }
        self.id = id
        self.name = name
        self.description = description
        self.url = url
    }
    
    var dictionaryValue: [AnyHashable : Any] {
        return [
            "id": self.id,
            "name": self.name,
            "description": self.description,
            "url": self.url
        ]
    }
}
