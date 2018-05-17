//
//  NewsViewController.swift
//  FreeNewsApp
//
//  Created by andresgerace on 15/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import UIKit
import SVProgressHUD

class NewsViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var newsTableView: UITableView!
    
    var source: NewsSource!
    let newsRepository = NewsRepository()
    var dataSource = NewsDataSource(news: [News]())
    var news = [News]()
    var isLoadingMoreNews = false
    var pageNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.source.name
        
        self.setupTableView()
        
        SVProgressHUD.show(withStatus: "Loading News...")
        self.retrieveNews(source: self.source.id)
    }
    
    private func setupTableView() {
        self.newsTableView.estimatedRowHeight = 600
        self.newsTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func retrieveNews(source: String) {
        if isLoadingMoreNews { return }
        let future = self.newsRepository.read(source: source, pageNumber: self.pageNumber, pageSize: 20)
        future.start() { result in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let news, let page):
                if news.isEmpty && self.pageNumber == 1 {
                    self.newsTableView.isHidden = true
                    return
                }
                self.pageNumber = page.number
                self.news.append(contentsOf: news)
                self.dataSource = NewsDataSource(news: self.news)
                self.newsTableView.dataSource = self.dataSource
                self.newsTableView.reloadData()
                self.isLoadingMoreNews = news.isEmpty
            case .failure(_):
                print ("failure")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.dataSource.news.count - 3 && isLoadingMoreNews == false {
            self.retrieveNews(source: self.source.id)
        }
    }
    
}
