//
//  Date + Ext..swift
//  Calendar_Counter
//
//  Created by Алексей Колыченков on 06.05.2025.
//

import Foundation

extension Date {
    
    ///рассчитывает разницу в кол-ве дней до события
    func getDifference(from date: Date = Date.now) -> Int {
        let calendar = Calendar.current
       
        let fromDate = calendar.startOfDay(for: date) //сегодняшняя дата
        let toDate = calendar.startOfDay(for: self) //установленная дата
        
        let differenceDays = calendar.dateComponents([.day], from: fromDate, to: toDate).day ?? 0
        return differenceDays
    }
    
    ///Date -> String
    func formatToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        return dateFormatter.string(from: self)
        }
}

