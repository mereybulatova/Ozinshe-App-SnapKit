//
//  Extensions.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 21.11.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

