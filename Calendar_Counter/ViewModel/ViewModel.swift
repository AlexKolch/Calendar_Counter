//
//  ViewModel.swift
//  Calendar_Counter
//
//  Created by Алексей Колыченков on 06.05.2025.
//

import Foundation


final class ViewModel: ObservableObject {
    
    @Published var endDate: String = Date().formatToString()
    @Published var mainText: String = ""
    
    private let userDefaults = UserDefaults.standard
    
    init () {
        getSavedData()
    }
    
    ///сохранение значений в userDefaults
    func save(text desription: String, and endDate: Date) {
        userDefaults.set(desription, forKey: "text")
        userDefaults.set(endDate, forKey: "endDate")
        
        setText(desription, date: endDate)
    }
    
    private func getSavedData() {
        if  let savedText = userDefaults.string(forKey: "text"),
            let savedDate = userDefaults.object(forKey: "endDate") as? Date {
            setText(savedText, date: savedDate)
        }
    }
    
    ///устанавливает значение для полей
    private func setText(_ text: String, date: Date) {
        guard let formattedText = formatDiffDateTo(text: text, from: date) else { return }
        
        self.mainText = formattedText
        self.endDate = date.formatToString()
    }
    
    //считает значение оставшихся дней до события
    private func formatDiffDateTo(text: String, from date: Date) -> String? {
        guard let range = text.range(of: "{date}") else { return nil } //диапазон символов описывающих дату
        let startPosition = text.distance(from: text.startIndex, to: range.lowerBound) //Position первого символа даты
        let endPosition = text.distance(from: text.startIndex, to: range.upperBound) //Position последнего символа даты
        
        //разбиваем текст на части
        let beginingOfString = text[0..<startPosition] //символы с начала строки, до первого символа даты
        let endOfString = text[endPosition..<text.count] //символы с последнего символа даты, до последнего символа строки
        
        let differenceInDays = date.getDifference().asText() //кол-во оставшихся дней{date} /for example: 5 - five
        
        let resultText = beginingOfString + differenceInDays + endOfString
        return resultText
    }
}
