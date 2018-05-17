//
//  NewsRepository.swift
//  FreeNewsApp
//
//  Created by andresgerace on 15/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import Foundation
import Jayme

class NewsRepository {
    typealias EntityType = News
    let backend = URLSessionBackend.freeNewsAppBackend()
    var name: String {
        return "v2/everything"
    }
    
    public func read(source: String, pageNumber: Int, pageSize: Int) -> Future<([News], PageInfo), JaymeError> {
        let path = self.name + "?sources=\(source)&page=\(pageNumber)&pageSize=\(pageSize)"
        var pageInfo : PageInfo?
        return self.backend.future(path: path, method: .GET, parameters: nil)
            .andThen { (data, page) in
                pageInfo = page
                return DataParser().dictionary(from: data)
            }
            .andThen{ (dictionary: [AnyHashable:Any]) in
                let articles = dictionary["articles"] as! [[AnyHashable:Any]]
                if pageInfo == nil {
                    pageInfo = PageInfo(number: pageNumber + 1, size: pageSize, total: dictionary["totalResults"] as! Int)
                }
                return EntityParser<News>().entities(from: articles)
            }
            .map{ (entities: [News]) in
                return (entities, pageInfo!)
            }
    }

}
