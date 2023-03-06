//
//  UILabel + Extensions.swift
//  tonus
//
//  Created by Витя Рябко on 25/02/23.
//

import UIKit

extension UILabel {

    convenience init(text: String, textColor: UIColor, font: UIFont?){
        self.init()
        self.text = text
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.7
        self.font = font
    }
}
