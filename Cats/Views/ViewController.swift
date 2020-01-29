//
//  ViewController.swift
//  Cats
//
//  Created by Bao Linh on 2020/01/29.
//  Copyright © 2020 Bao Linh. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: FactTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiRequest = ApiRequest()
        apiRequest.facts(completionHandler: {
            [weak self] results, error in
            if case .failure = error {
                return
            }
            self?.tableView.data = results
        })
    }
}

