//
//  ImageCollectionViewCell.swift
//  Cats
//
//  Created by Bao Linh on 2020/01/29.
//  Copyright © 2020 Bao Linh. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var inputImageUrl: URL? {
        didSet {
            guard let url = inputImageUrl else { return }
            imageView.image = UIImage(url: url)
        }
    }
}
