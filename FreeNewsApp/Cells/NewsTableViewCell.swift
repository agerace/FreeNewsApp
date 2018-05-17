//
//  NewsTableViewCell.swift
//  FreeNewsApp
//
//  Created by andresgerace on 16/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
  
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var newsAuthorAndDateLabel: UILabel!
    
    var news : News! {
        didSet {
            newsImageView.image = nil
            newsImageView.downloadedFrom(link: news.thumbnailURL)
            newsTitleLabel.text = news.title
            newsDescriptionLabel.text = news.body
            newsAuthorAndDateLabel.text = "\(news.author) | \(news.publishedDate.formattedDateString())"
            
        }
    }
    @IBAction func openFullArticlePage(_ sender: UIButton) {
        UIApplication.shared.open(URL(string : self.news.articleUrl)!, options: [:], completionHandler: nil)
    }
}
