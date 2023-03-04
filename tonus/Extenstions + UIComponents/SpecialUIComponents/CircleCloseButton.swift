//
//  CircleCloseButton.swift
//  tonus
//
//  Created by Витя Рябко on 04/03/23.
//

import UIKit

class CircleCloseButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        config()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config(){
        self.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
    }
    
    
}
