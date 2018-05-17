//
//  String+FormattedDate.swift
//  FreeNewsApp
//
//  Created by andresgerace on 17/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import Foundation

extension String {
    func formattedDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let testDate = dateFormatter.date(from: self)//"2018-05-17T12:58:25Z")
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from:testDate!)
    }
}
