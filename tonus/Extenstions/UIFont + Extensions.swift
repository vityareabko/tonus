//
//  UIFont + Extensions.swift
//  tonus
//
//  Created by Витя Рябко on 22/02/23.
//

import UIKit

extension UIFont {
    
//    label.font = UIFont(name: "Roboto-Medium", size: 24)

    //Medium
    static func robotoMedium12() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    static func robotoMedium14() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    static func robotoMedium16() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    static func robotoMedium18() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    static func robotoMedium22() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 22) ?? UIFont.systemFont(ofSize: 22, weight: .medium)
    }
    
    static func robotoMedium24() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .medium)
    }
    
    static func robotoMedium36() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 36) ?? UIFont.systemFont(ofSize: 36, weight: .medium)
    }
    
    //Bold
    static func robotoBold12() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .bold)
    }
    
    static func robotoBold16() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    static func robotoBold20() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    static func robotoBold24() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    static func robotoBold36() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 36) ?? UIFont.systemFont(ofSize: 36, weight: .bold)
    }
    
    static func robotoBold48() -> UIFont? {
        return UIFont.init(name: "Roboto-Bold", size: 48) ?? UIFont.systemFont(ofSize: 48, weight: .bold)
    }
}
