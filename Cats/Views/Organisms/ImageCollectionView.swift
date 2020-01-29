//
//  ImageCollectionView.swift
//  Cats
//
//  Created by Bao Linh on 2020/01/29.
//  Copyright © 2020 Bao Linh. All rights reserved.
//

import UIKit

class ImageCollectionView: UICollectionView {
    
    private let cellHeight: CGFloat = 200

    var data: [URL?] = [] {
        didSet {
            reloadData()
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        var size = bounds.size
        size.height = cellHeight
        return size
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadNib()
    }
    
    func loadNib() {
        dataSource = self
        delegate = self
        let nib = UINib.init(nibName: "ImageCollectionViewCell", bundle: nil)
        register(nib, forCellWithReuseIdentifier: "ImageCollectionViewCell")
    }
}

extension ImageCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.inputImageUrl = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellHeight, height: cellHeight)
    }
}
