//
//  FactTableView.swift
//  Cats
//
//  Created by Bao Linh on 2020/01/29.
//  Copyright © 2020 Bao Linh. All rights reserved.
//

import UIKit

final class FactTableView: UITableView {
    
    var data: [String] = [] {
        didSet {
            reloadData()
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return contentSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        invalidateIntrinsicContentSize()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadNib()
    }
    
    func loadNib() {
        dataSource = self
        delegate = self
        
        let nib = UINib.init(nibName: "FactTableViewCell", bundle: nil)
        register(nib, forCellReuseIdentifier: "FactTableViewCell")
        tableFooterView = UIView()
        rowHeight = UITableView.automaticDimension
    }
}

extension FactTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FactTableViewCell", for: indexPath) as? FactTableViewCell else {
            return UITableViewCell()
        }

        cell.inputText = data[indexPath.row]
        return cell
    }
}
