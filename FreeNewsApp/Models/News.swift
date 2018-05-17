//
//  News.swift
//  FreeNewsApp
//
//  Created by andresgerace on 15/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import Foundation
import Jayme
import SwiftyJSON

struct News: Identifiable {
    let id: String
    let title: String
    let body: String
    let thumbnailURL: String
    let author: String
    let publishedDate: String
    let articleUrl: String
}

extension News: DictionaryInitializable, DictionaryRepresentable {
    
    init(dictionary: [AnyHashable : Any]) throws {
        let json = JSON(dictionary)
        guard let id = json["url"].string,
            let title = json["title"].string,
            let body = json["description"].string,
            let thumbnailURL = json["urlToImage"].string,
            let author = json["author"].string,
            let publishedDate = json["publishedAt"].string,
            let articleUrl = json["url"].string
            else {  throw JaymeError.parsingError }
        self.id = id
        self.title = title
        self.body = body
        self.thumbnailURL = thumbnailURL
        self.author = author
        self.publishedDate = publishedDate
        self.articleUrl = articleUrl
    }
    
    var dictionaryValue: [AnyHashable : Any] {
        return [
            "id": self.title,
            "title": self.title,
            "body": self.body,
            "thumbnailURL": self.thumbnailURL,
            "author": self.author,
            "publishedDate": self.publishedDate,
            "url": self.articleUrl
        ]
    }
}
