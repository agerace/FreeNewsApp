//
//  NewsSourcesDataSource.swift
//  FreeNewsApp
//
//  Created by andresgerace on 16/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import UIKit

class NewsSourcesDataSource: NSObject, UITableViewDataSource {
    
    let newsSources: [NewsSource]
    
    init(newsSources: [NewsSource]) {
        self.newsSources = newsSources
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NewsSourceCellIdentifier) as! NewsSourceTableViewCell
        cell.source = self.newsSources[indexPath.row]
        return cell
        
    }
}
