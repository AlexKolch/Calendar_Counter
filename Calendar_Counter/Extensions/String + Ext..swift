//
//  String + Ext..swift
//  Calendar_Counter
//
//  Created by Алексей Колыченков on 06.05.2025.
//

import Foundation

extension String {
    ///получаем текст из текста по указанному диапазону
    subscript(range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }
}
