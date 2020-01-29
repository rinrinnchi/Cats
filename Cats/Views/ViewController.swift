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
    @IBOutlet weak var collectionView: ImageCollectionView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.isHidden = true
        indicatorView.startAnimating()
        
        let apiRequest = ApiRequest()
        apiRequest.facts(completionHandler: { [weak self] results, error in
            if case .failure = error {
                return
            }
            self?.tableView.data = results
            self?.stackView.isHidden = false
            self?.indicatorView.stopAnimating()
        })
        
        apiRequest.images(completionHandler: { [weak self] results, error in
            if case .failure = error {
                return
            }
            self?.collectionView.data = results
        })
    }
}

