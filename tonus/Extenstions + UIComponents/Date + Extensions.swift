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
    
    func getWeekArray() -> [[String]] {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        
        
        
        var weekArray: [[String]] = [[], []]
        
        for index in -6...0 {
            // charakter Day
            formatter.dateFormat = "EEEEEE"
            let date = calendar.date(byAdding: .day, value: index, to: self) ?? Date() // Monday Tuesday .....
            let weekDay = formatter.string(from: date) // используем формат - Md td wd th fr st sd
            weekArray[0].append(weekDay)
            
            // number Of Day
            formatter.dateFormat = "dd"
            let numDay = formatter.string(from: date)
            weekArray[1].append("\(numDay)")
        }
         
        return weekArray
    }
    
    func offsetDay(day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -day, to: self) ?? Date()
    }
}
