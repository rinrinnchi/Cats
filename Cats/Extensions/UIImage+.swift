//
//  UIImage+.swift
//  Cats
//
//  Created by Bao Linh on 2020/01/29.
//  Copyright © 2020 Bao Linh. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    public convenience init(url: URL) {
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
