//
//  UISlider + Extensions.swift
//  tonus
//
//  Created by Витя Рябко on 03/03/23.
//

import UIKit

extension UISlider {
    convenience init(value: Float, minValue: Float, maxValue: Float, minColor: UIColor?, maxColor: UIColor?){
        self.init()
        
        self.value = value
        self.minimumValue = minValue
        self.maximumValue = maxValue
        if let minColor = minColor{
            self.minimumTrackTintColor = minColor
        }
        
        if let maxColor = maxColor {
            self.maximumTrackTintColor = maxColor
        }
    }
}
