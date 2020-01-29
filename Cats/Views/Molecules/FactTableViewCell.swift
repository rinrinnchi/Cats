//
//  FactTableViewCell.swift
//  Cats
//
//  Created by Bao Linh on 2020/01/29.
//  Copyright © 2020 Bao Linh. All rights reserved.
//

import UIKit

final class FactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    var inputText: String? {
        didSet {
            label.text = inputText
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        inputText = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        inputText = nil
    }
}
