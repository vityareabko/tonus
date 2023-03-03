//
//  UIGreenSlider.swift
//  tonus
//
//  Created by Витя Рябко on 03/03/23.
//

import UIKit

class UIGreenSlider : UISlider{
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config(){
        self.minimumTrackTintColor = .specialLightGreen
    }
}
