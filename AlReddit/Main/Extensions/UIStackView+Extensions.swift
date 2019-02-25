//
//  UIStackView+Extensions.swift
//  AlReddit
//
//  Created by Khalid Asad on 2019-02-24.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    
    func removeAllArrangedSubViews() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
