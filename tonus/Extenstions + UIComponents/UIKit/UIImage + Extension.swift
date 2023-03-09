//
//  UIImage + Extension.swift
//  tonus
//
//  Created by Витя Рябко on 25/02/23.
//

import UIKit

extension UIImageView {
    
    convenience init(nameImage: String){
        self.init()
        self.image = UIImage(named: nameImage)
        self.contentMode = .scaleAspectFit
    }
}
