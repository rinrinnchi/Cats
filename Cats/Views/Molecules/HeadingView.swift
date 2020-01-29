//
//  HeadingView.swift
//  Cats
//
//  Created by Bao Linh on 2020/01/29.
//  Copyright © 2020 Bao Linh. All rights reserved.
//

import UIKit

class HeadingView: UIView {

    @IBOutlet weak var label: UILabel!
    @IBInspectable var heading: String? {
        didSet {
            label.text = heading
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    func loadNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "HeadingView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
    }
}
