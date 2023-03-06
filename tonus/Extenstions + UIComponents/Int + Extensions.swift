//
//  Int + Extensions.swift
//  tonus
//
//  Created by Витя Рябко on 06/03/23.
//

import Foundation

extension Int {
    func getTimeFromSecond() -> String {
        
        if self / 60  == 0 {
            return "\(self % 60)sec"
        }
        
        if self % 60 == 0 {
            return "\(self / 60)min"
        }
        
        return "\(self / 60)min \(self % 60)sec"
    }
}
