//
//  NewsSourcesViewController.swift
//  FreeNewsApp
//
//  Created by andresgerace on 15/5/18.
//  Copyright © 2018 andresgerace. All rights reserved.
//

import UIKit
import SVProgressHUD

class NewsSourcesViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var sourcesTableView: UITableView!
    @IBOutlet weak var tryAgainButton: UIButton!

    let sourceRepository = SourceRepository()
    let newsRepository = NewsRepository()
    var dataSource = NewsSourcesDataSource(newsSources: [NewsSource]())
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News Sources"
        self.retrieveSources()
    }
 
    private func retrieveSources() {
        SVProgressHUD.show(withStatus: "Loading news sources...")
        let future = self.sourceRepository.readAll()
        future.start() { result in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let sources):
                self.dataSource = NewsSourcesDataSource(newsSources: sources)
                self.sourcesTableView.dataSource = self.dataSource
                self.sourcesTableView.reloadData()
            case .failure(_):
                SVProgressHUD.showError(withStatus: "An error ocurred")
                self.tryAgainButton.isHidden = false
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
        viewController.source = self.dataSource.newsSources[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tryAgain(_ sender: UIButton) {
        self.tryAgainButton.isHidden = true
        self.retrieveSources()
    }
}
