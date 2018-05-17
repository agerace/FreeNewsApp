//
//  SourceRepository.swift
//  FreeNewsApp
//
//  Created by andresgerace on 15/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import Foundation
import Jayme

class SourceRepository: Readable {
    typealias EntityType = NewsSource
    let backend = URLSessionBackend.freeNewsAppBackend()
    var name: String {
        return "v2/sources"
    }
    func readAll() -> Future<[NewsSource], JaymeError> {
        let path = self.name
        return self.backend.future(path: path, method: .GET, parameters: nil)
            .andThen { DataParser().dictionary(from: $0.0) }
            .andThen { EntityParser().entities(from: $0["sources"] as! [[AnyHashable:Any]]) }
    }
}
