//
//  NewsDataSource.swift
//  FreeNewsApp
//
//  Created by andresgerace on 16/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import UIKit

class NewsDataSource: NSObject, UITableViewDataSource {
    
    let news: [News]
    
    init(news: [News]) {
        self.news = news
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NewsCellIdentifier) as! NewsTableViewCell 
        cell.news = self.news[indexPath.row]
        return cell
        
    }
}
