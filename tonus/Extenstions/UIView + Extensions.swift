//
//  UIView + Extension.swift
//  tonus
//
//  Created by Витя Рябко on 22/02/23.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 0.5
    }
}
