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
    
    func shake(horizontal: CGFloat = 0, verticatly: CGFloat = 0){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - horizontal, y: self.center.y - verticatly))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + horizontal, y: self.center.y + verticatly))
        
        self.layer.add(animation, forKey: "position")
    }
}
