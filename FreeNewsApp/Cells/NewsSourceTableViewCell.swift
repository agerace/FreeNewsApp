//
//  NewsSourceTableViewCell.swift
//  FreeNewsApp
//
//  Created by andresgerace on 16/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import UIKit

class NewsSourceTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceUrlButton: UIButton!
    @IBOutlet weak var sourceDescriptionLabel: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    var source : NewsSource! {
        didSet {
            sourceNameLabel.text = source.name
            sourceDescriptionLabel.text = source.description
            sourceUrlButton.setTitle(source.url, for: .normal)
        }
    }
    @IBAction func openSourcePage(_ sender: UIButton) {
        UIApplication.shared.open(URL(string : self.source.url)!, options: [:], completionHandler: nil)
    }
    
}
