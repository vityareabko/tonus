//
//  UIButton + Extensions.swift
//  tonus
//
//  Created by Витя Рябко on 04/03/23.
//

import UIKit

extension UIButton {
    
    convenience init(text: String, bagroungColor: UIColor, textColor: UIColor){
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        self.backgroundColor = bagroungColor
        self.tintColor = textColor
        self.layer.cornerRadius = 10
        self.titleLabel?.font = .robotoBold16()!
    }
}
