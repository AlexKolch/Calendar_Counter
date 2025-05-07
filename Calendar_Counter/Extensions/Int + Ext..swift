//
//  Int + Ext..swift
//  Calendar_Counter
//
//  Created by Алексей Колыченков on 07.05.2025.
//

import Foundation

extension Int {
    
    func asText() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut //0 - zero, 1 - one
        
        return formatter.string(for: self) ?? "??"
    }
}
