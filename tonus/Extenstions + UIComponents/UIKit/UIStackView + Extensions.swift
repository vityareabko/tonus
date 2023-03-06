//
//  UIStackView + Extensions.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit

/*
 
 let stackView = UIStackView()
 
 stackView.addArrangedSubviews(YourSubview)
 stackView.addArrangedSubviews(YourSubview)
 stackView.addArrangedSubviews(YourSubview)
 stackView.addArrangedSubviews(YourSubview)
 
 stackView.axis = .horizontal
 stackView.spacing = 10
 stackView.translatesAutoresizingMaskIntoConstraints = false
 
 
 */

extension UIStackView{
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat){
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
