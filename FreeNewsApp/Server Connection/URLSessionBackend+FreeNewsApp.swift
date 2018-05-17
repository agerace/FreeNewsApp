//
//  URLSessionBackend+FreeNewsApp.swift
//  FreeNewsApp
//
//  Created by andresgerace on 15/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import Foundation
import Jayme

extension URLSessionBackend {
    static func freeNewsAppBackend() -> URLSessionBackend {
        let httpHeaders = [HTTPHeader(field: "Accept", value: "application/json"),
                           HTTPHeader(field: "Content-Type", value: "application/json"),
                           HTTPHeader(field: "X-Api-Key", value: Constants.ApiKey)]
        let configuration = URLSessionBackendConfiguration(basePath:Constants.FreeNewsBackendURL, httpHeaders:httpHeaders)
        return URLSessionBackend(configuration: configuration)
    }
}
