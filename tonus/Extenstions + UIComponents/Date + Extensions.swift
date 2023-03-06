//
//  Date + Extensions.swift
//  tonus
//
//  Created by Витя Рябко on 06/03/23.
//

import Foundation

extension Date {
    func getNumberOfDayOfWeek() -> Int {
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: self)
        return weekDay
    }
}
